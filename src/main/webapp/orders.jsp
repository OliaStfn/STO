<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${text.getProperty(lang.concat(".orders"))}</title>
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
                <h3 class="panel-title">${text.getProperty(lang.concat(".orders"))}</h3>
                <div class="pull-right">
                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span>
                        ${text.getProperty(lang.concat(".filter"))}
                    </button>
                </div>
            </div>
            <table class="table">
                <thead>
                <tr class="filters">
                    <th style="width: 5%"><input type="text" class="form-control" placeholder="#" disabled></th>
                    <th><input type="text" class="form-control"
                               placeholder="${text.getProperty(lang.concat(".car_brand"))}" disabled></th>
                    <th><input type="text" class="form-control"
                               placeholder="${text.getProperty(lang.concat(".car_model"))}" disabled></th>
                    <th><input type="text" class="form-control"
                               placeholder="${text.getProperty(lang.concat(".license_plate"))}" disabled></th>
                    <th><input type="text" class="form-control"
                               placeholder="${text.getProperty(lang.concat(".orders.services"))}" disabled></th>
                    <th><input type="text" class="form-control"
                               placeholder="${text.getProperty(lang.concat(".orders.price"))}" disabled></th>
                    <th><input type="text" class="form-control"
                               placeholder="${text.getProperty(lang.concat(".orders.reception_point"))}" disabled></th>
                    <th><input type="text" class="form-control"
                               placeholder="${text.getProperty(lang.concat(".orders.master"))}" disabled></th>
                    <th><input type="text" onfocus="(this.type='date')" onblur="(this.type='text')"
                               class="form-control"
                               placeholder="${text.getProperty(lang.concat(".orders.created_date"))}" disabled></th>
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
            <input id="add" class="btn col-md-2 pull-right" type="button" value="${text.getProperty(lang.concat(".add_order"))}"
                   onclick="location.href='/add-new-order.jsp'">
        </div>
    </div>
    <c:import url="footer.jsp"/>
</body>
</html>
