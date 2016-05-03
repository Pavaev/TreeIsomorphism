<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
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

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

    <![endif]-->
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
    <div class="row">

        <div class="col-xs-12 col-sm-9">
            <p class="pull-right visible-xs">
                <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
            </p>
            <c:choose>
                <c:when test="${not empty user}">

                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad">
                        <c:if test="${not empty message}">
                            <h1 class="alert alert-success">${message}</h1>
                        </c:if>

                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title">${user.firstName} ${user.lastName} ${user.midName}</h3>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-3 col-lg-3 " align="center"><img alt="User Pic"
                                                                                        src="http://babyinfoforyou.com/wp-content/uploads/2014/10/avatar-300x300.png"
                                                                                        class="img-circle img-responsive">
                                    </div>

                                    <div class=" col-md-9 col-lg-9 ">
                                        <table class="table table-user-information">
                                            <tbody>

                                            <tr>
                                                <td>Email:</td>
                                                <td>${user.username}</td>
                                            </tr>
                                            <tr>
                                                <td>Телефон</td>
                                                <td>${user.phone}</td>
                                            </tr>

                                            <tr>
                                            <tr>
                                                <td>Пол</td>
                                                <td>${user.sex}</td>
                                            </tr>
                                            <tr>
                                                <td>Город</td>
                                                <td>${user.town}</td>
                                            </tr>


                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                            </div>
                            <c:set var="id"><sec:authentication property="principal.id"/></c:set>


                            <div class="panel-footer">

                                <c:if test="${id==user.id}">


                        <span class="pull-right">



                            <a href="<c:url value="/user/id${id}/delete"/>" data-original-title="Remove this user"
                               data-toggle="tooltip" type="button"
                               class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>

                                </span>
                                </c:if>

                            </div>

                        </div>

                    </div>
                </c:when>
                <c:otherwise>
                    <h3 class="alert alert-danger">Страница удалена или еще не создана</h3>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="../assets/bootstrap/js/bootstrap.min.js"></script>
<script src="../assets/js/offcanvas.js"></script>
<script src="../assets/js/holder.js"></script>

</body>
</html>
