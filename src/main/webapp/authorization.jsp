<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${text.getProperty(lang.concat(".authorization"))}</title>
    <meta content="text/html" charset="UTF-8">
    <link href="/css/style.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/libs/bootstrap.css">
    <script src="/libs/jquery-3.3.1.min.js"></script>
    <script src=/"libs/bootstrap.js"></script>
    <link href="/css/authorization.css" rel="stylesheet">
    <script src="/js/authorization.js"></script>
</head>
<body>
<c:import url="header.jsp"/>
<div id="fullscreen_bg" class="fullscreen_bg"></div>
<div id="regContainer" class="container content">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-login">
                <div class="panel-heading">
                    <div class="row">
                        <c:if test="${!paramValues.containsKey('type') || param.type == 'login'}">
                            <c:set var="login" value="display: block;"/>
                            <c:set var="register" value="display: none;"/>
                            <c:set var="forgot" value="display: none;"/>
                            <div class="col-xs-6">
                                <a href="authorization?type=login" class="active" id="login-form-link">
                                ${text.getProperty(lang.concat(".login"))}</a>
                            </div>
                            <div class="col-xs-6">
                                <a href="authorization?type=register" id="register-form-link">
                                ${text.getProperty(lang.concat(".register"))}</a>
                            </div>
                        </c:if>
                        <c:if test="${param.type == 'register'}">
                            <c:set var="login" value="display: none;"/>
                            <c:set var="register" value="display: block;"/>
                            <c:set var="forgot" value="display: none;"/>
                            <div class="col-xs-6">
                                <a href="authorization?type=login" id="login-form-link">
                                ${text.getProperty(lang.concat(".login"))}</a>
                            </div>
                            <div class="col-xs-6">
                                <a href="authorization?type=register" class="active"
                                   id="register-form-link">${text.getProperty(lang.concat(".register"))}</a>
                            </div>
                        </c:if>
                    </div>
                    <hr>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <form accept-charset="UTF-8" id="login-form" action="/login" method="post" role="form" style="${login}">
                                <div class="form-group">
                                    <span class="text-center" style="color: red">
                                    ${requestScope.message}</span><br>
                                    <label for="username">${text.getProperty(lang.concat(".username"))}</label>
                                    <input type="text" name="username" id="username" tabindex="1"
                                           class="form-control"
                                           placeholder="${text.getProperty(lang.concat(".username"))}" value="">
                                </div>
                                <div class="form-group">
                                    <label for="password">${text.getProperty(lang.concat(".password"))}</label>
                                    <input type="password" name="password" id="password" tabindex="2"
                                           class="form-control"
                                           placeholder="${text.getProperty(lang.concat(".password"))}">
                                </div>
                                <div class="form-group col-xs-6">
                                    <a href="" id="forgot-form-link">
                                    ${text.getProperty(lang.concat(".login.forgot_password"))}</a>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <input type="submit" name="login-submit" id="login-submit" tabindex="4"
                                                   class="form-control btn btn-login"
                                                   value="${text.getProperty(lang.concat(".login.submit"))}">
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <form accept-charset="UTF-8" id="register-form" action="/register" method="post" role="form" style="${register}">
                                <div class="form-group">
                                    <span class="text-center" style="color: red">
                                    ${requestScope.message}</span><br>
                                    <label for="name">${text.getProperty(lang.concat(".name"))}</label>
                                    <input type="text" name="name" id="name" tabindex="1"
                                           class="form-control"
                                           placeholder="${text.getProperty(lang.concat(".name"))}" value="" required>
                                </div>
                                <div class="form-group">
                                    <label for="surname">${text.getProperty(lang.concat(".surname"))}</label>
                                    <input type="text" name="surname" id="surname" tabindex="2"
                                           class="form-control"
                                           placeholder="${text.getProperty(lang.concat(".surname"))}" required>
                                </div>
                                <div class="form-group">
                                    <label for="birthDay">${text.getProperty(lang.concat(".born_date"))}</label>
                                    <input type="text" onfocus="this.type='date'"
                                           name="birthDay" id="birthDay" tabindex="2"
                                           class="form-control"
                                           placeholder="${text.getProperty(lang.concat(".born_date"))}" required>
                                </div>
                                <div class="form-group">
                                    <label for="username">${text.getProperty(lang.concat(".username"))}</label>
                                    <input type="text" name="username" id="username" tabindex="3"
                                           class="form-control"
                                           placeholder="${text.getProperty(lang.concat(".username"))}" value="" required>
                                </div>
                                <div class="form-group">
                                    <label for="password">${text.getProperty(lang.concat(".password"))}</label>
                                    <input type="password" name="password" id="password" tabindex="4"
                                           class="form-control"
                                           placeholder="${text.getProperty(lang.concat(".password"))}" required>
                                </div>
                                <div class="form-group">
                                    <label for="email">${text.getProperty(lang.concat(".email"))}</label>
                                    <input type="email" name="email" id="email"
                                           tabindex="5" class="form-control"
                                           placeholder="${text.getProperty(lang.concat(".email"))}" required>
                                </div>
                                <div class="form-group">
                                    <label for="phone">${text.getProperty(lang.concat(".phone"))}</label>
                                    <input type="tel" name="phone" id="phone"
                                           tabindex="6" class="form-control"
                                           placeholder="+38(___)-___-__-__" required>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <input type="submit" name="register-submit" id="register-submit"
                                                   tabindex="7" class="form-control btn btn-register"
                                                   value="${text.getProperty(lang.concat(".register.submit"))}">
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <form accept-charset="UTF-8" id="forgot-form" action="/authorization" method="post" role="form"
                                  style="display: none">
                                <div class="form-group">
                                    <label for="email">${text.getProperty(lang.concat(".email"))}</label>
                                    <input type="email" name="username" id="email" tabindex="1"
                                           class="form-control"
                                           placeholder="${text.getProperty(lang.concat(".email"))}" value="">
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <input type="submit" name="forgot-submit" id="forgot-submit" tabindex="2"
                                                   class="form-control btn btn-login"
                                                   value="${text.getProperty(lang.concat(".forgot.submit"))}">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<c:import url="footer.jsp"/>
</body>
</html>
