<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Мої замовлення</title>
    <meta content="text/html" charset="UTF-8">
    <link href="/css/style.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/libs/bootstrap.css">
    <script src="/libs/jquery-3.3.1.min.js"></script>
    <script src="/libs/bootstrap.js"></script>
    <link href="/css/table.css" rel="stylesheet">
    <script src="/js/table.js"></script>
</head>
<body>
<c:import url="header.jsp"/>
<div class="container content">
    <div class="row">
        <div class="panel panel-primary filterable">
            <div class="panel-heading">
                <h3 class="panel-title">Послуги</h3>
                <div class="pull-right">
                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span>
                        Фільтрувати
                    </button>
                </div>
            </div>
            <table class="table">
                <thead>
                <tr class="filters">
                    <th style="width: 5%"><input type="text" class="form-control" placeholder="#" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Марка машини" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Модель машини" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Номерний знак" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Послуга" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Вартість" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Місце ремонту" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Майстер" disabled></th>
                    <th><input type="text" onfocus="(this.type='date')" onblur="(this.type='text')"
                               class="form-control" placeholder="Дата створення" disabled></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="order" items="${sessionScope.orders}">
                    <tr>
                        <td>${order.id}</td>
                        <td>${order.carBrand}</td>
                        <td>${order.carModel}</td>
                        <td>${order.licensePlate}</td>
                        <td>
                            <c:forEach var="service" items="${order.services}">
                                ${service}<br>
                            </c:forEach>
                        </td>
                        <td>${order.allPrice}</td>
                        <td>${order.receptionPoint}</td>
                        <td>${order.masterId}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <input id="add" class="btn col-md-2 pull-right" type="button" value="Додати нове замовлення"
                   onclick="location.href='/add-new-order.jsp'">
        </div>
    </div>
    <c:import url="footer.jsp"/>
</body>
</html>
