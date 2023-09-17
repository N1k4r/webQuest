<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%--<html>--%>
<%--    <head>--%>
<%--        <title>JSP - Hello World</title>--%>
<%--    </head>--%>

<%--    <body>--%>
<%--    <h1><%= "Hello World!" %>--%>
<%--    </h1>--%>
<%--    <br/>--%>
<%--    <a href="hello-servlet">Hello Servlet</a>--%>
<%--    </body>--%>
<%--</html>--%>

<html>
<head>
    <meta charset = "UTF-8">
    <title>Quest</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<script>
    $(document).ready(function() {
        $("#startButton").click(function (){
            var name = $("#user-name").val();
            $.ajax({
                type: "POST",
                url: "http://localhost:8080/start",
                data: jQuery.param({userName : name}),
                success : function () {
                    location.replace("http://localhost:8080/game")
                }
            });
        });
    });
</script>





<body>
    <div>
        <h1>В поисках Вечного Кристала</h1>
        <br>
        <h2>Введите имя</h2>
    </div>

    <div class="input-field">
        <input type="text" id="user-name" style="font-size: 1.2em;" maxlength="25">
    </div>

    <br>

    <button id = "startButton" type="button" style="font-size: 1.5em;">Начать</button>
    <br><br>
    <h2>Концовок открыто: ${sessionScope.endings} из 6</h2>

    <div>
        <br><br>
        <p>Сюжет и текст квеста сгенерировала нейросеть ChatGPT</p>
        <p>Картинки сгенерировала нейросеть Shedevrum</p>
    </div>
</body>
</html>