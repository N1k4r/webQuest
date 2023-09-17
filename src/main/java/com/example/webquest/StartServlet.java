package com.example.webquest;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(value = "/start")
public class StartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("endings") == null)
            req.getSession().setAttribute("endings", 0);
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String name = req.getParameter("userName");
        session.setAttribute("userName", name.isEmpty() ? "Странник" : name);
        session.setAttribute("area", Area.FOREST);
        session.setAttribute("amulet", 0);
        session.setAttribute("end", null);
    }
}