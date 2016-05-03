<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">

    <title>Доска позора|Пожаловаться на некачественные товары и услуги|Отзывы</title>


    <link href="../assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../assets/css/offcanvas.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../assets/css/complaint-item.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>

    <script type="text/javascript">
        ymaps.ready(init);

        function init() {
            myMap = new ymaps.Map('map', {
                center: [${complaint.coords}],
                zoom: 13
            }, {
                searchControlProvider: 'yandex#search'
            });


            myGeoObject = new ymaps.GeoObject({
                geometry: {
                    type: "Point",
                    coordinates: [${complaint.coords}]
                },

            }, {
                draggable: false
            })

            myMap.geoObjects.add(myGeoObject);
        }</script>
</head>

<body>
<div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<c:url value="/"/>">Доска Позора</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="<c:url value="/"/>">Главная</a></li>
                <li><a href="#about">О проекте</a></li>
                <li><a href="#contact">Контакты</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <sec:authorize access="isAnonymous()">
                    <li><a href="${s:mvcUrl('SC#login').build()}">Войти</a></li>
                    <li><a href="${s:mvcUrl('SC#register').build()}">Регистрация</a></li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li><a href="${s:mvcUrl('SC#profile').build()}">Мой профиль</a></li>
                    <li><a href="<c:url value="/logout"/>">Выход</a></li>
                </sec:authorize>
            </ul>

        </div>
        <!-- /.nav-collapse -->
    </div>
    <!-- /.container -->
</div>
<!-- /.navbar -->

<div class="container">

    <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">
            <p class="pull-right visible-xs">
                <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
            </p>
            <c:choose>
            <c:when test="${not empty complaint}">
            <div class="col-md-12">

                <div class="caption-full">

                    <div id="map" style="width: 600px; height: 400px"></div>
                </div>
                <h4>${complaint.header}
                </h4>
                <c:set var="id"><sec:authentication property="principal.id"/></c:set>
                <c:if test="${id==complaint.user.id}">
                    <a href="${s:mvcUrl("CC#delete").arg(0, complaint.id).build()}">
                        <button class="pull-right btn-danger">Удалить</button>
                    </a>
                    <a href="${s:mvcUrl("CC#edit").arg(0, complaint.id).build()}">
                        <button class="pull-right btn-success">Изменить</button>
                    </a>
                </c:if>
                <p>${complaint.post}</p>
                <b>${complaint.company}</b>
                <br>
                By:
                <u>${complaint.user.username}</u>
                <br>
                <a class='btn btn-info btn-xs'
                   href="<c:url value="/user/id${complaint.user.id}"/>"><span
                        class="glyphicon glyphicon-edit"></span> К странице пользователя</a>


            </div>


        </div>

    </div>
    </c:when>
    <c:otherwise>
        <h3 class="alert alert-danger">Страница удалена или еще не создана</h3>
    </c:otherwise>
    </c:choose>


</div>
<!--/row-->

<hr>


</div>
<!--/.container-->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faste  r -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="../assets/bootstrap/js/bootstrap.min.js"></script>
<script src="../assets/js/offcanvas.js"></script>
<script src="../assets/js/holder.js"></script>


</body>
</html>