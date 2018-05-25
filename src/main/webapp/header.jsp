<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="/css/header.css" rel="stylesheet">
<script src="/js/header.js"></script>

<nav id="header" class="navbar navbar-fixed-top">
    <div id="header-container" class="container navbar-container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a id="brand" class="navbar-brand" href="">СТО Люкс</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="home">Головна сторінка</a></li>
                <c:if test="${!sessionScope.containsKey('user') || sessionScope.userType!='admin'}">
                    <li><a href="/services">Послуги</a></li>
                </c:if>
                <li><a href="/vacancies">Вакансії</a></li>
                <c:if test="${sessionScope.containsKey('user')}">
                    <c:if test="${sessionScope.userType=='customer'}">
                        <li><a href="/orders">Мої замовлення</a></li>
                    </c:if>
                    <c:if test="${sessionScope.userType=='admin'}">
                        <li><a href="/orders">Замовлення</a></li>
                        <li><a href="/services">Редагування послуг</a></li>
                        <li><a href="/settings/customers">Клієнти</a></li>
                        <li><a href="/settings/masters">Майстри</a></li>
                    </c:if>
                </c:if>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:if test="${sessionScope.containsKey('user')}">
                    <li class="right"><a href="/authorization?type=logout">Вийти</a></li>
                </c:if>
                <c:if test="${!sessionScope.containsKey('user')}">
                    <li class="right"><a href="/authorization?type=login">Вхід</a></li>
                    <li class="right"><a href="/authorization?type=register">Реєстрація</a></li>
                </c:if>
            </ul>
        </div><!-- /.nav-collapse -->
    </div><!-- /.container -->
</nav>
<!-- /.navbar -->