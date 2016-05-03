<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html;charset=utf-8"  pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="геа-8">
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

    <c:choose>
    <c:when test="${not empty page.getContent()}">


        <c:url var="firstUrl" value="/list/1"/>
        <c:url var="lastUrl" value="/list/${page.totalPages}"/>
        <c:url var="prevUrl" value="/list/${currentIndex - 1}"/>
        <c:url var="nextUrl" value="/list/${currentIndex + 1}"/>


    <div class="pagination">
        <ul class="pagination">
            <c:choose>
                <c:when test="${currentIndex == 1}">
                    <li class="disabled"><a href="#">&lt;&lt;</a></li>
                    <li class="disabled"><a href="#">&lt;</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="${firstUrl}">&lt;&lt;</a></li>
                    <li><a href="${prevUrl}">&lt;</a></li>
                </c:otherwise>
            </c:choose>
            <c:forEach var="i" begin="${beginIndex}" end="${endIndex}">
                <c:url var="pageUrl" value="/list/${i}"/>
                <c:choose>
                    <c:when test="${i == currentIndex}">
                        <li class="active"><a href="${pageUrl}"><c:out value="${i}"/></a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="${pageUrl}"><c:out value="${i}"/></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:choose>
                <c:when test="${currentIndex == page.totalPages}">
                    <li class="disabled"><a href="#">&gt;</a></li>
                    <li class="disabled"><a href="#">&gt;&gt;</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="${nextUrl}">&gt;</a></li>
                    <li><a href="${lastUrl}">&gt;&gt;</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>


    <div class="container">
        <div class="row">

            <form method="GET" class="form-inline" role="form">
                <input type="submit" class="btn btn-success btn-xs btn-filter" value="Применить фильтр"/>

                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>

                                <div class="btn-group">
                                    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown"
                                            aria-expanded="false">Фильтр <span class="caret"></span></button>
                                    <div class="dropdown-menu" role="menu">
                                        <div class="input-group">
                                            <input type="number" name="from" value=1 class="form-control input-number"
                                                   min=1>
                                            <label class="input-group-addon">От</label></div>
                                        <div class="input-group">
                                            <input type="number" name="to" value=1 class="form-control" min=1/>
                                            <label class="input-group-addon">До</label></div>
                                    </div>
                                </div>

                                <p class="column-heading">#</p>
                            </th>
                            <th>
                                <input type="text" class="form-control" placeholder="Фильтр" name="comp">

                                <p class="column-heading"> Название фирмы </p></th>

                            <th>Заголовок</th>
                            <th>Текст</th>
                            <th>Имя пользователя</th>
                        </tr>
                        </thead>
                        <c:forEach var="complaint" items="${page.getContent()}">
                            <tr>
                                <td>${complaint.id}</td>
                                <td>${complaint.company}</td>
                                <td>${complaint.header}</td>
                                <td>${complaint.post}</td>
                                <td>${complaint.user.id}</td>
                                <td class="text-center"><a class='btn btn-info btn-xs'
                                                           href="<c:url value="/complaint/${complaint.id}"/>"><span
                                        class="glyphicon glyphicon-edit"></span> Подробнее</a>
                                <td class="text-center"><a class='btn btn-info btn-xs'
                                                           href="<c:url value="/user/id${complaint.user.id}"/>"><span
                                        class="glyphicon glyphicon-edit"></span> К странице пользователя</a>
                            </tr>
                        </c:forEach>
                    </table>

                </div>
            </form>
        </div>
        </c:when>
        <c:otherwise>
            <h3 class="alert alert-danger">Ничего не найдено</h3>
        </c:otherwise>
        </c:choose>
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