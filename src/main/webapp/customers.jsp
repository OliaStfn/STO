<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Послуги</title>
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
                <h3 class="panel-title">Користувачі</h3>
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
                    <th style="width: 8%"><input type="text" class="form-control" placeholder="Ім'я" disabled></th>
                    <th style="width: 10%"><input type="text" class="form-control" placeholder="Прізвище" disabled></th>
                    <th><input type="text" onfocus="(this.type='date')" onblur="(this.type='text')"
                               class="form-control" placeholder="Дата народження" disabled></th>
                    <th><input type="email" class="form-control" placeholder="Електронна пошта" disabled></th>
                    <th style="width: 8%"><input type="tel" class="form-control" placeholder="Телефон" disabled></th>
                    <th><input type="datetime" class="form-control" placeholder="Дата реєстрації" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Використання мікроавтобуса" disabled></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="customer" items="${sessionScope.customers}">
                    <tr>
                        <td>${customer.id}</td>
                        <td>${customer.name}</td>
                        <td>${customer.surname}</td>
                        <td>${customer.dateOfBirth}</td>
                        <td>${customer.email}</td>
                        <td>${customer.phoneNumber}</td>
                        <td>${customer.createdDate.dayOfMonth}.${customer.createdDate.monthValue}.${customer.createdDate.year}<br>
                                ${customer.createdDate.hour}:${customer.createdDate.minute}:${customer.createdDate.second}</td>
                        <%--<td>${customer.needBus}</td>--%>
                        <c:if test="${customer.needBus}">
                            <td>+</td>
                        </c:if>
                        <c:if test="${!customer.needBus}">
                            <td>-</td>
                        </c:if>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<c:import url="footer.jsp"/>
</body>
</html>
