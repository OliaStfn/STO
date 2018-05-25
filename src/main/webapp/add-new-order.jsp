<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Додавання нового замовлення</title>
    <meta content="text/html" charset="UTF-8">
    <link href="/css/style.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/libs/bootstrap.css">
    <script src="/libs/jquery-3.3.1.min.js"></script>
    <script src=/"libs/bootstrap.js"></script>
    <link href="/css/form.css" rel="stylesheet">
</head>
<body>
<c:import url="header.jsp"/>
<div class="container content">
    <div class="col-md-6 col-md-offset-3">
        <div class="form-area">
            <form accept-charset="UTF-8" action="/settings/masters" method="post" role="form">
                <br style="clear:both">
                <h3 style="margin-bottom: 25px; text-align: center;">Нове замовлення</h3>
                <div class="form-group">
                    <input type="text" class="form-control" name="carBrand" placeholder="Марка машини" required>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="carModel" placeholder="Модель машини" required>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="licensePlate" placeholder="Номерний знак" required>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="passport" placeholder="Серія паспорту"
                           required>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="address" placeholder="Місце прийому машини"
                           required>
                </div>
                <select name="services" class="selectpicker" multiple data-live-search="true">
                    <c:forEach var="category" items="${categories}">
                        <optgroup label="${category}">
                            <c:forEach var="service" items="${sessionScope.services}">
                                <c:if test="${category == service.category}">
                                    <option value="${service.id}">${service.name}</option>
                                </c:if>
                            </c:forEach>
                        </optgroup>
                    </c:forEach>
                </select>
                <button type="submit" id="submit" class="btn btn-primary pull-right">Створити замовлення</button>
            </form>
        </div>
    </div>
</div>
<c:import url="footer.jsp"/>
</body>
</html>