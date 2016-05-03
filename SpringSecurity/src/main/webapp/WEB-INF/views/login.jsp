<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
  <link href="../assets/css/signin.css" rel="stylesheet">


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
          <li><a href="${s:mvcUrl('SC#login').build()}">Войти</a></li>
          <li><a href="${s:mvcUrl('SC#register').build()}">Регистрация</a></li>
      </ul>
    </div>
    <!-- /.nav-collapse -->
  </div>
  <!-- /.container -->
</div>
<!-- /.navbar -->

<div class="container">


  <form:form class="form-signin" commandName="login">
    <h2 class="form-signin-heading">Please sign in</h2>
    <label for="inputEmail" class="sr-only">Email address</label>
    <form:input type="text" id="inputEmail" class="form-control" placeholder="Email address" required="true" autofocus="true" path="username"/>
    <label for="inputPassword" class="sr-only">Password</label>
    <form:input type="password" id="inputPassword" class="form-control" placeholder="Password" required="true" path="password"/>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
  </form:form>


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