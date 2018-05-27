<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="/css/footer.css" rel="stylesheet"/>
<div class="footer">
    <div class="copy-right">
        <span>© 2018 ${text.getProperty(lang.concat(".label"))}</span>
        <br>
        <span>${text.getProperty(lang.concat(".footer.copy-right"))}</span>
    </div>

    <div class="contacts">
        <span>admin@sto-luks.com</span><br>
        <span>+38 (093) 555 55 23, +38 (066) 222 33 79</span><br>
        <span>${text.getProperty(lang.concat(".footer.address"))}</span>
    </div>

    <div id="img" class="networks">
        <span>${text.getProperty(lang.concat(".footer.networks"))}</span><br>
        <img src="/img/networks/t.png"/>
        <img src="/img/networks/f.png"/>
        <img src="/img/networks/g.png"/>
        <img src="/img/networks/v.png"/>
    </div>
</div>