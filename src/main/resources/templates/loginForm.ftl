<!DOCTYPE html>
<head>
    <title>Spring Security Example </title>
</head>
<body>
<#--<div th:if="${param.error}">
    Invalid username and password.
</div>
<div th:if="${param.logout}">
    You have been logged out.
</div>-->



<form action="/webapp/loginAction" method="post">
    <div><label> User Name : <input type="text" name="id"/> </label></div>
    <div><label> Password: <input type="password" name="password"/> </label></div>
    <div><input type="submit" value="Sign In"/></div>
</form>
</body>
</html>