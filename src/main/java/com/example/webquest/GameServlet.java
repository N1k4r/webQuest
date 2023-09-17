package com.example.webquest;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

@WebServlet(value = "/game")
public class GameServlet extends HttpServlet {

    private final Set<End> ENDINGS = new HashSet<>();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (req.getParameter("area") != null) {
            Area area = Area.valueOf(req.getParameter("area"));
            session.setAttribute("area", area);
            if (area == Area.AMULET)
                session.setAttribute("amulet",1);

            if (area == Area.FIGHT) {
                if ((int) session.getAttribute("amulet") == 1) {
                    session.setAttribute("area", Area.CAVE_RIGHT);
                } else {
                    setAttributes(session, null, End.VICTORY_AT_ANY_COST);
                }
            }
        }
        Optional.ofNullable(req.getParameter("end"))
                .ifPresent(s -> setAttributes(session, null, End.valueOf(req.getParameter("end"))));

        Optional.ofNullable(req.getParameter("restart"))
                .ifPresent(s -> {
                    session.setAttribute("amulet", 0);
                    setAttributes(session, Area.FOREST, null);
                });

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/game.jsp").forward(req, resp);
    }

    private void setAttributes(HttpSession session, Area area, End end){
        session.setAttribute("area", area);
        session.setAttribute("end", end);

        if (end != null){
            ENDINGS.add(end);
            session.setAttribute("endings", ENDINGS.size());
        }
    }
}
