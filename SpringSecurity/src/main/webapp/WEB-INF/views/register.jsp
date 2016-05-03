<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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

    <title>Доска позора|Пожаловаться на некачественные товары и слуги|Отзывы</title>

    <link href="../assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../assets/css/offcanvas.css" rel="stylesheet">
    <link href="../assets/css/registerfont.css" rel="stylesheet">

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

            </ul>
        </div>
        <!-- /.nav-collapse -->
    </div>
    <!-- /.container -->
</div>
<!-- /.navbar -->

<div class="container">

    <h2 class="label-horizontal">Регистрация</h2>
    <c:if test="${not empty message}">
        <h1 class="alert alert-success">${message}</h1>
    </c:if>
    <form:form class="form-horizontal" method="POST" commandName="user">
        <div class="form-group">
            <form:label class="control-label col-xs-3" for="lastName" path="lastName">Фамилия:</form:label>
            <div class="col-xs-9">
                <form:input type="text" class="form-control" id="lastName" placeholder="Введите фамилию"
                            path="lastName"/>
                <b id="warning">
                    <form:errors path="lastName"/>
                </b>
            </div>

        </div>
        <div class="form-group">
            <form:label class="control-label col-xs-3" for="firstName" path="firstName">Имя:</form:label>
            <div class="col-xs-9">
                <form:input type="text" class="form-control" id="firstName" placeholder="Введите имя" path="firstName"/>
                <b id="warning">
                    <form:errors path="firstName"/>
                </b>
            </div>

        </div>
        <div class="form-group">
            <form:label class="control-label col-xs-3" for="fatherName" path="midName">Отчество:</form:label>
            <div class="col-xs-9">
                <form:input type="text" class="form-control" id="fatherName" placeholder="Введите отчество"
                            path="midName"/>

            </div>
        </div>

        <div class="form-group">
            <form:label class="control-label col-xs-3" for="inputEmail" path="username">Email:</form:label>
            <div class="col-xs-9">
                <form:input type="email" class="form-control" id="inputEmail" placeholder="Email" path="username"/>
                <b id="warning">
                    <form:errors path="username"/>
                </b>
            </div>
        </div>
        <div class="form-group">
            <form:label class="control-label col-xs-3" for="inputPassword" path="password">Пароль:</form:label>
            <div class="col-xs-9">
                <form:input type="password" class="form-control" id="inputPassword" placeholder="Введите пароль"
                            path="password"/>
                <b id="warning">
                    <form:errors path="password" font-color="red"/>
                </b>
            </div>
        </div>

        <div class="form-group">
            <form:label class="control-label col-xs-3" for="phoneNumber" path="phone">Телефон:</form:label>
            <div class="col-xs-9">
                <form:input type="tel" class="form-control" id="phoneNumber" placeholder="Введите номер телефона"
                            path="phone"/>
            </div>
        </div>
        <div class="form-group">
            <form:label class="control-label col-xs-3" name="town" for="postalAddress" path="town">Город:</form:label>
            <div class="col-xs-9">
                <form:select rows="3" name="town" class="form-control" id="postalAddress"
                             path="town">
                    <c:forEach var="town" items="${townList}">
                        <option value="${town.getId()}">${town.getName()}</option>
                    </c:forEach>
                </form:select>
            </div>
        </div>

        <div class="form-group">
            <form:label class="control-label col-xs-3" for="sex" path="sex">Пол:</form:label>
            <div class="col-xs-2">
                <form:label class="radio-inline" path="sex">
                    <form:radiobutton name="genderRadios" value="Мужской" id="sex" path="sex"/> Мужской
                </form:label>
            </div>
            <div class="col-xs-2">
                <label class="radio-inline">
                    <form:radiobutton name="genderRadios" value="Женский" id="sex" path="sex"/> Женский
                </label>
            </div>
            <form:errors path="sex"/>
        </div>
        <br>


        <div class="form-group">
            <div class="col-xs-offset-3 col-xs-9">
                <input type="submit" class="btn btn-primary" value="Регистрация">
                <input type="reset" class="btn btn-default" value="Очистить форму">
            </div>
        </div>
    </form:form>

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
</body>
</html>