<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">

    <title>Доска позора|Пожаловаться на некачественные товары и слуги|Отзывы</title>


    <link href="../assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../assets/css/offcanvas.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

    <![endif]-->
</head>

<body>
<%
    request.setCharacterEncoding("UTF-8");
%>

<div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<c:url value="/"/>">Доска Позора </a>
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


            <div class="jumbotron">
                <h1>Добро пожаловать на доску позора</h1>

                <p>Здесь вы можете поделиться своими замечаниями о некачественных товарах или услугах, а также
                    ознакомиться с отзывами других потребителей</p>
            </div>
            <a href="${s:mvcUrl('CC#complaint').build()}" role="button" class="btn btn-success btn-lg btn-block">Написать
                отзыв</a>
            <a href="<c:url value="/list/1"/>" role="button" class="btn btn-default btn-lg btn-block">Показать все</a>


        </div>
        <!--/span-->


    </div>
    <!--/row-->


    <hr>

    <footer>
        <p>&copy; Company 2016</p>
    </footer>

</div>
<!--/.container-->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="../assets/bootstrap/js/bootstrap.min.js"></script>
<script src="../assets/js/offcanvas.js"></script>
<script src="../assets/js/holder.js"></script>
</body>
</html>