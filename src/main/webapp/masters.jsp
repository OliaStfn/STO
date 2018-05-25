<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Послуги</title>
    <meta content="text/html" charset="UTF-8">
    <link href="/css/style.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/libs/bootstrap.css">
    <script src="/libs/jquery-3.3.1.min.js"></script>
    <script src=/"libs/bootstrap.js"></script>
    <link href="/css/table.css" rel="stylesheet">
    <script src="/js/table.js"></script>
</head>
<body>
<c:import url="header.jsp"/>
<div class="container content">
    <div class="row">
        <div class="panel panel-primary filterable">
            <div class="panel-heading">
                <h3 class="panel-title">Працівники</h3>
                <div class="pull-right">
                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span>
                        Фільтрувати
                    </button>
                </div>
            </div>
            <table class="table">
                <thead>
                <tr class="filters">
                    <th style="width: 4%"><input type="text" class="form-control" placeholder="#" disabled></th>
                    <th style="width: 7%"><input type="text" class="form-control" placeholder="Ім'я" disabled></th>
                    <th style="width: 10%"><input type="text" class="form-control" placeholder="Прізвище" disabled></th>
                    <th><input type="text" onfocus="(this.type='date')" onblur="(this.type='text')"
                               class="form-control" placeholder="Дата народження" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Адреса" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Номер паспорту" disabled></th>
                    <th><input type="tel" class="form-control" placeholder="Телефон" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Посада" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Місце роботи" disabled></th>
                    <th style="width: 7%"><input type="text" class="form-control" placeholder="Статус" disabled></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="master" items="${sessionScope.masters}">
                    <tr>
                        <td>${master.id}</td>
                        <td>${master.name}</td>
                        <td>${master.surname}</td>
                        <td>${master.dateOfBirth}</td>
                        <td>${master.address}</td>
                        <td>${master.passport}</td>
                        <td>${master.phoneNumber}</td>
                        <td>${master.post}</td>
                        <td>${master.workPlace}</td>
                        <td>${master.status.toString().toLowerCase()}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <input id="add" class="btn col-md-2 pull-right" type="button" value="Додати нового майстра"
                   onclick="location.href='/add-new-master.jsp'">
        </div>
    </div>
</div>
<hr>
<c:import url="footer.jsp"/>
</body>
</html>
