<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.webquest.Area" %>
<%@ page import="com.example.webquest.End" %><%--
  Created by IntelliJ IDEA.
  User: kira
  Date: 9/16/2023
  Time: 10:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quest</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script>
        function selectArea(area){
            $.ajax({
                type: "POST",
                url: "http://localhost:8080/game",
                data: { area: area },
                success : function () {
                    location.reload();
                }
            })
        }

        function selectEnd(end){
            $.ajax({
                type: "POST",
                url: "http://localhost:8080/game",
                data: { end: end },
                success : function () {
                    location.reload();
                }
            })
        }

        function restartGame() {
            $.ajax({
                type: "POST",
                url: "http://localhost:8080/game",
                data: { restart: 1 },
                success : function () {
                    location.reload()
                }
            })
        }

        function backToMenu() {
            $.ajax({
                type: "POST",
                url: "http://localhost:8080/game",
                data: { restart: 1 },
                success : function () {
                    location.replace("http://localhost:8080/start")
                }
            })
        }
    </script>
</head>
<body>
    <c:set var="FOREST" value="<%=Area.FOREST%>"/>
    <c:set var="LAWN" value="<%=Area.LAWN%>"/>
    <c:set var="CAVE" value="<%=Area.CAVE%>"/>
    <c:set var="RIDDLE" value="<%=Area.RIDDLE%>"/>
    <c:set var="TREASURES" value="<%=Area.TREASURES%>"/>
    <c:set var="MAZE" value="<%=Area.MAZE%>"/>
    <c:set var="TROLL" value="<%=Area.TROLL%>"/>
    <c:set var="FOREST_CAVE" value="<%=Area.FOREST_CAVE%>"/>
    <c:set var="CAVE_RIGHT" value="<%=Area.CAVE_RIGHT%>"/>
    <c:set var="AMULET" value="<%=Area.AMULET%>"/>
    <c:set var="FIGHT" value="<%=Area.FIGHT%>"/>

    <c:set var="GUARDIAN_OF_THE_FOREST" value="<%=End.GUARDIAN_OF_THE_FOREST%>"/>
    <c:set var="BRAVE_WARRIOR" value="<%=End.BRAVE_WARRIOR%>"/>
    <c:set var="VICTORY_AT_ANY_COST" value="<%=End.VICTORY_AT_ANY_COST%>"/>
    <c:set var="ABANDONED_QUEST" value="<%=End.ABANDONED_QUEST%>"/>
    <c:set var="ETERNAL_DESIRE" value="<%=End.ETERNAL_DESIRE%>"/>
    <c:set var="LOST_IN_TIME" value="<%=End.LOST_IN_TIME%>"/>
    <c:set var="RECKLESS_TRAVELER" value="<%=End.RECKLESS_TRAVELER%>"/>

    <c:if test="${sessionScope.area == FOREST}">
        <h1>Древний лес</h1>
        <hr>
        <p style="font-size: 1.7em; font-style: italic">
            <img src="${pageContext.request.contextPath}/images/forest.jpg" width="500" height="500" alt="image" align="left" hspace="20"/>
            ${sessionScope.userName}, ты обнаруживаешь, что стоишь у входа в древний лес, окутанный легендами.
            Твое путешествие начинается с того, что ты ищешь легендарный Вечный кристалл, могущественный артефакт,
            который, как говорят, исполняет невообразимые желания. Когда ты входишь в густой лес, ты замечаешь развилку
            на тропинке. Слева от тебя раскинулась залитая солнцем поляна, а справа - таинственный вход в пещеру.
            Какой путь ты выберешь?
        </p>
</c:if>

    <c:if test="${sessionScope.area == LAWN}">
        <h1>Солнечная поляна</h1>
        <hr>
        <p style="font-size: 1.7em; font-style: italic">
            <img src="${pageContext.request.contextPath}/images/lawn.jpeg" width="500" height="500" alt="image" align="left" hspace="20"/>
            Ты идешь по извилистой тропинке к поляне, где течет спокойный ручей. Появляется существо, похожее на фею,
            предлагающee тебе руководство. Она говорит, что, чтобы достичь Вечного Кристалла, ты должен пройти ряд
            испытаний. Твоя первая задача - пересечь ручей. Попытайся пересечь ручей, используя камни или найди
            упавшее бревно, чтобы использовать его в качестве моста.
        </p>
    </c:if>

    <c:if test="${sessionScope.area == RIDDLE}">
        <h1>Хранитель загадок</h1>
        <hr>
        <p style="font-size: 1.7em; font-style: italic">
            <img src="${pageContext.request.contextPath}/images/lawn_log.jpeg" width="500" height="500" alt="image" align="left" hspace="20"/>
            Ты обыскиваешь поляну и находишь крепкое упавшее бревно, которое можно использовать в качестве
            моста. Ты благополучно пересекаешь ручей и благодаришь фею за ее руководство. Она ведет тебя глубже
            в лес, где вы встречаете хранителя загадок. Он предлагает разгадать его загадку.
        </p>
    </c:if>

    <c:if test="${sessionScope.area == FOREST_CAVE}">
        <h1>Древний лес</h1>
        <hr>
        <p style="font-size: 1.7em; font-style: italic">
            <img src="${pageContext.request.contextPath}/images/forest.jpg" width="500" height="500" alt="image" align="left" hspace="20"/>
            Ты решаешь проигнорировать загадку и двигаться вперед. Страж, оскорбленный твоим неуважением,
            преграждает тебе путь. У тебя нет другого выбора, кроме как вернуться на поляну и выбрать другой путь.
        </p>
    </c:if>

    <c:if test="${sessionScope.area == CAVE}">
        <h1>Таинственная пещера</h1>
        <hr>
        <p style="font-size: 1.7em; font-style: italic">
            <img src="${pageContext.request.contextPath}/images/cave.jpeg" width="500" height="500" alt="image" align="left" hspace="20"/>
            Ты решаешь войти в таинственную пещеру. Внутри тебя встречает жуткий шепот и тускло освещенные
            туннели. Через некоторое время ты натыкаешься на два отрывка.
        </p>
    </c:if>

    <c:if test="${sessionScope.area == TREASURES}">
        <h1>Сундук с сокровищами</h1>
        <hr>
        <p style="font-size: 1.7em; font-style: italic">
            <img src="${pageContext.request.contextPath}/images/treasures.jpeg" width="500" height="500" alt="image" align="left" hspace="20"/>
            Ты выбираешь левый проход, который ведет тебя в пещеру, наполненную светящимися грибами. В их
            свете виден спрятанный сундук с сокровищами.
        </p>
    </c:if>

    <c:if test="${sessionScope.area == MAZE}">
        <h1>Лабиринт</h1>
        <hr>
        <p style="font-size: 1.7em; font-style: italic">
            <img src="${pageContext.request.contextPath}/images/maze.jpeg" width="500" height="500" alt="image" align="left" hspace="20"/>
            Ты выбираете правильный проход, который приводит тебя в лабиринтообразный лабиринт. Проходя по
            лабиринту, ты обнаруживаешь зашифрованное послание на одной из стен.
        </p>
    </c:if>

    <c:if test="${sessionScope.area == AMULET}">
        <h1>Артефакт</h1>
        <hr>
        <p style="font-size: 1.7em; font-style: italic">
            <img src="${pageContext.request.contextPath}/images/amulet.jpeg" width="500" height="500" alt="image" align="left" hspace="20"/>
            Ты открываешь сундук и находишь внутри мощный амулет. Это расширяет твои способности, делая тебя
            более уверенным в себе по мере продолжения своего путешествия.
        </p>

    </c:if>

    <c:if test="${sessionScope.area == TROLL}">
        <h1>Пещерный тролль</h1>
        <hr>
        <p style="font-size: 1.7em; font-style: italic">
            <img src="${pageContext.request.contextPath}/images/troll.jpeg" width="500" height="500" alt="image" align="left" hspace="20"/>
            Продолжая исследование, вы сталкиваетесь с угрожающим пещерным троллем.
        </p>
    </c:if>

    <c:if test="${sessionScope.area == CAVE_RIGHT}">
        <h1>Таинственная пещера</h1>
        <hr>
        <p style="font-size: 1.7em; font-style: italic">
            <img src="${pageContext.request.contextPath}/images/cave.jpeg" width="500" height="500" alt="image" align="left" hspace="20"/>
            Ты храбро вступаешь с троллем в бой и выходишь победителем. Амулет, который ты ранее нашел в сундуке
            оказался очень полезным, без него ты бы не справился. В конечном итоге, бродя по пещере ты возвращаешься
            туда, откуда пришел. Тебе больше ничего не остается, как выбрать другой путь.
        </p>
    </c:if>


    <div id="options_containers">
        <form id="options_form">
            <c:if test="${sessionScope.area == FOREST}">
                <button type="button" class="button" onclick="selectArea('${LAWN}')" style="font-size: 1.3em">Пойти к поляне</button>
                <button type="button" class="button" onclick="selectArea('${CAVE}')" style="font-size: 1.3em">Спуститься в пещеру</button>
            </c:if>

            <c:if test="${sessionScope.area == LAWN}">
                <button type="button" class="button" onclick="selectEnd('${RECKLESS_TRAVELER}')" style="font-size: 1.3em">Использовать камни</button>
                <button type="button" class="button" onclick="selectArea('${Area.RIDDLE}')" style="font-size: 1.3em">Найти бревно</button>
            </c:if>

            <c:if test="${sessionScope.area == RIDDLE}">
                <button type="button" class="button" onclick="selectEnd('${GUARDIAN_OF_THE_FOREST}')" style="font-size: 1.3em">Попытаться разгадать</button>
                <button type="button" class="button" onclick="selectArea('${FOREST_CAVE}')" style="font-size: 1.3em">Проигнорировать</button>
            </c:if>

            <c:if test="${sessionScope.area == FOREST_CAVE}">
                <button type="button" class="button" onclick="selectArea('${CAVE}')" style="font-size: 1.3em">Спуститься в пещеру</button>
            </c:if>

            <c:if test="${sessionScope.area == CAVE_RIGHT}">
                <button type="button" class="button" onclick="selectArea('${MAZE}')" style="font-size: 1.3em">Свернуть направо</button>
            </c:if>

            <c:if test="${sessionScope.area == CAVE}">
                <button type="button" class="button" onclick="selectArea('${TREASURES}')" style="font-size: 1.3em">Свернуть налево</button>
                <button type="button" class="button" onclick="selectArea('${MAZE}')" style="font-size: 1.3em">Свернуть направо</button>
            </c:if>

            <c:if test="${sessionScope.area == TREASURES}">
                <button type="button" class="button" onclick="selectArea('${AMULET}')" style="font-size: 1.3em">Открыть сундук</button>
                <button type="button" class="button" onclick="selectArea('${TROLL}')" style="font-size: 1.3em">Пройти мимо</button>
            </c:if>

            <c:if test="${sessionScope.area == AMULET}">
                <button type="button" class="button" onclick="selectArea('${TROLL}')" style="font-size: 1.3em">Продолжить исследовать пещеру</button>
            </c:if>

            <c:if test="${sessionScope.area == TROLL}">
                <button type="button" class="button" onclick="selectArea('${FIGHT}')" style="font-size: 1.3em">Вступить в бой</button>
                <button type="button" class="button" onclick="selectEnd('${ABANDONED_QUEST}')" style="font-size: 1.3em">Проскользнуть мимо</button>
            </c:if>

            <c:if test="${sessionScope.area == MAZE}">
                <button type="button" class="button" onclick="selectEnd('${ETERNAL_DESIRE}')" style="font-size: 1.3em">Попытаться расшифровать сообщение</button>
                <button type="button" class="button" onclick="selectEnd('${LOST_IN_TIME}')" style="font-size: 1.3em">Проигнорировать</button>
            </c:if>
        </form>
    </div>


    <c:if test="${sessionScope.end == RECKLESS_TRAVELER}">
        <h1 style="color: crimson">Опрометчивый путешественник</h1>
        <hr>
        <p style="font-size: 1.7em; font-style: italic">
            <img src="${pageContext.request.contextPath}/images/reckless.jpeg" width="500" height="500" alt="image" align="left" hspace="20"/>
            Ты осторожно ступаешь на камни, но теряешь равновесие и падаешь в воду. Тебе не удается переплыть на
            другой берег, ты мокрый и замерзший. Ты не можешь продолжать путешествие.
        </p>
        <button type="button" class="button" onclick="restartGame()" style="font-size: 1.3em">Начать сначала</button>
    </c:if>

    <c:if test="${sessionScope.end == GUARDIAN_OF_THE_FOREST}">
        <h1 style="color: crimson">Страж леса</h1>
        <hr>
        <p style="font-size: 1.7em; font-style: italic">
            <img src="${pageContext.request.contextPath}/images/guardian.jpeg" width="500" height="500" alt="image" align="left" hspace="20"/>
            Ты успешно разгадал загадку, произведя впечатление на стража, но так и не смог найти Вечный кристалл.
            Ты заслуживаешь уважения лесных стражей и становишься защитником древних лесов.
        </p>
        <button type="button" class="button" onclick="restartGame()" style="font-size: 1.3em">Начать сначала</button>
    </c:if>

    <c:if test="${sessionScope.end == VICTORY_AT_ANY_COST}">
        <h1 style="color: crimson">Победа любой ценой</h1>
        <hr>
        <p style="font-size: 1.7em; font-style: italic">
            <img src="${pageContext.request.contextPath}/images/victory_at_any_cost.jpeg" width="500" height="500" alt="image" align="left" hspace="20"/>
            Ты храбро вступаешь с троллем в бой и выходишь победителем. Однако ты ранены и должны найти
            способ исцелить себя. Спустя многое время скитаний по пещере, ты окончательно утратил силы двигаться
            дальше и в конце концов потерял сознание.
        </p>
        <button type="button" class="button" onclick="restartGame()" style="font-size: 1.3em">Начать сначала</button>
    </c:if>

    <c:if test="${sessionScope.end == ABANDONED_QUEST}">
        <h1 style="color: crimson">Заброшенный квест</h1>
        <hr>
        <p style="font-size: 1.7em; font-style: italic">
            <img src="${pageContext.request.contextPath}/images/abandoned_quest.jpeg" width="500" height="500" alt="image" align="left" hspace="20"/>
            Ты пытаешься проскользнуть мимо тролля, но случайно наступаешь на незакрепленный камень, предупреждая
            тролля о своем присутствии. Ты вынужден спасаться бегством, покидая пещеру и возвращаясь ко входу в лес.
            Разочарованный трудностями, Ты отказываешься от своих поисков Вечного кристалла и возвращаешься в мир, из
            которого пришел.</p>
        <button type="button" class="button" onclick="restartGame()" style="font-size: 1.3em">Начать сначала</button>
    </c:if>

    <c:if test="${sessionScope.end == LOST_IN_TIME}">
        <h1 style="color: crimson">Затерянный во времени</h1>
        <hr>
        <p style="font-size: 1.7em; font-style: italic">
            <img src="${pageContext.request.contextPath}/images/lost.jpeg" width="500" height="500" alt="image" align="left" hspace="20"/>
            Ты игнорируешь сообщение и продолжаешь блуждать по лабиринту, безнадежно заблудившись. Измученный и
            разочарованный, ты в конце концов, остаешься навечно заточенный в лабиринтообразном лабиринте.</p>
        <button type="button" class="button" onclick="restartGame()" style="font-size: 1.3em">Начать сначала</button>
    </c:if>

    <c:if test="${sessionScope.end == ETERNAL_DESIRE}">
        <h1 style="color: forestgreen">Вечное желание</h1>
        <hr>
        <p style="font-size: 1.7em; font-style: italic">
            <img src="${pageContext.request.contextPath}/images/crystal.jpeg" width="500" height="500" alt="image" align="left" hspace="20"/>
            Ты успешно расшифровываешь сообщение, которое дает ценные подсказки о расположении лабиринта. Обладая
            этими знаниями, ты добираешься до выхода из лабиринта. После него ты успешно проходишь еще ряд испытания
            и наконец достигаешь Вечного кристалла, сила которого сможет исполнить самые сокровенные желания!
        </p>
        <br>
        <h2>Ты успешно прошел игру!!!</h2>
        <button type="button" class="button" onclick="restartGame()" style="font-size: 1.3em">Начать сначала</button>
    </c:if>

    <div id="back_to_menu">
        <br><br>
        <form id="menu">
            <button type="button" class="button" onclick="backToMenu()" style="font-size: 1.3em; color: cadetblue">Меню</button>
        </form>
    </div>
</body>
</html>
