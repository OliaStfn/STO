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
            <a id="brand" class="navbar-brand" href="">${text.getProperty(lang.concat(".label"))}</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="home">${text.getProperty(lang.concat(".home"))}</a></li>
                <c:if test="${!sessionScope.containsKey('user') || sessionScope.userType!='admin'}">
                    <li><a href="/services">${text.getProperty(lang.concat(".services"))}</a></li>
                </c:if>
                <li><a href="/vacancies">${text.getProperty(lang.concat(".vacancies"))}</a></li>
                <c:if test="${sessionScope.containsKey('user')}">
                    <c:if test="${sessionScope.userType=='customer'}">
                        <li><a href="/orders">${text.getProperty(lang.concat(".orders"))}</a></li>
                    </c:if>
                    <c:if test="${sessionScope.userType=='admin'}">
                        <li><a href="/orders">${text.getProperty(lang.concat(".orders"))}</a></li>
                        <li><a href="/services">${text.getProperty(lang.concat(".edit_services"))}</a></li>
                        <li><a href="/settings/customers">${text.getProperty(lang.concat(".customers"))}</a></li>
                        <li><a href="/settings/masters">${text.getProperty(lang.concat(".masters"))}</a></li>
                    </c:if>
                </c:if>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:if test="${sessionScope.containsKey('user')}">
                    <li class="right"><a href="/authorization?type=logout">${text.getProperty(lang.concat(".logout"))}</a></li>
                </c:if>
                <c:if test="${!sessionScope.containsKey('user')}">
                    <li class="right"><a href="/authorization?type=login">${text.getProperty(lang.concat(".login"))}</a></li>
                    <li class="right"><a href="/authorization?type=register">${text.getProperty(lang.concat(".register"))}</a></li>
                </c:if>
            </ul>
        </div><!-- /.nav-collapse -->
    </div><!-- /.container -->
</nav>
<!-- /.navbar -->