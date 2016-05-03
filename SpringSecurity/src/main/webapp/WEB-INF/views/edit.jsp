<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html;charset=utf-8"  pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
  <script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>


  <script type="text/javascript">
    ymaps.ready(init);

    function init() {
      var myPlacemark,
              myMap = new ymaps.Map('map', {
                center: [55.753994, 37.622093],
                zoom: 9
              }, {
                searchControlProvider: 'yandex#search'
              });


      myMap.events.add('click', function (e) {
        var coords = e.get('coords');


        if (myPlacemark) {
          myPlacemark.geometry.setCoordinates(coords);
        }

        else {
          myPlacemark = createPlacemark(coords);
          myMap.geoObjects.add(myPlacemark);

          myPlacemark.events.add('dragend', function () {
            getAddress(myPlacemark.geometry.getCoordinates());
          });
        }
        getAddress(coords);
      });


      function createPlacemark(coords) {
        return new ymaps.Placemark(coords, {
          iconContent: 'поиск...'
        }, {
          preset: 'islands#violetStretchyIcon',
          draggable: true
        });
      }


      function getAddress(coords) {
        document.getElementById('coords').value = coords;
        myPlacemark.properties.set('iconContent', 'поиск...');
        ymaps.geocode(coords).then(function (res) {
          var firstGeoObject = res.geoObjects.get(0);

          myPlacemark.properties
                  .set({
                    iconContent: firstGeoObject.properties.get('name'),
                    balloonContent: firstGeoObject.properties.get('text')
                  });
        });
      }
    }
  </script>

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

  <h2 class="label-horizontal">Добавить</h2>
  <c:if test="${not empty message}">
    <h1 class="alert alert-success">${message}</h1>
  </c:if>
  <form:form class="form-horizontal" method="POST" commandName="complaint">
    <div class="form-group">
      <form:label class="control-label col-xs-3" for="lastName" path="header">Заголовок:</form:label>
      <div class="col-xs-9">
        <form:input type="text" class="form-control" id="lastName" placeholder="Введите заголовок"
                    path="header"/>
        <b id="warning">
          <form:errors path="header"/>
        </b>
      </div>

    </div>
    <div class="form-group">
      <form:label class="control-label col-xs-3" for="firstName" path="post">Основной текст:</form:label>
      <div class="col-xs-9">
        <form:input type="post" class="form-control" id="firstName" placeholder="Основной текст" path="post"/>
        <b id="warning">
          <form:errors path="post"/>
        </b>
      </div>

    </div>

    <div class="form-group">
      <form:label class="control-label col-xs-3" for="inputEmail" path="company"
                  name="company">Название компании:</form:label>
      <div class="col-xs-9">
        <form:input type="text" class="form-control" id="inputEmail" placeholder="Название компании"
                    path="company"/>
        <b id="warning">
          <form:errors path="company"/>
        </b>

      </div>
    </div>
    <div class="form-group">
      <div class="col-xs-offset-3 col-xs-9">


        <br>

        <div id="map" style="width: 600px; height: 400px"></div>
        <form:input type="hidden" id="coords" name="coords" path="coords" readonly="true"/>
      </div>
    </div>
    <div class="form-group">
      <div class="col-xs-offset-3 col-xs-9">
        <input type="submit" class="btn btn-primary" value="Изменить">
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
<script src="../assets/js/holder.js"></script>

</body>
</html>