<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1 align="center">     </h1>
<hr/>
<h3>Register Yourself</h3>
<form:form action="register/add" commandName="user" method="post">
Email:<form:input type="text" path="email_id" name="email_id" /><br/>
First Name:<form:input type="text" path="f_name" name="f_name"/><br/>
Last Name:<form:input type="text" path="l_name" name="l_name" /><br/>
Address:<form:input type="text" path="addrs" name="addrs" /><br/>
Phone no:<form:input type="text" path="mb_no" name="mb_no" /><br/>
Password:<form:input type="password" path="password" name="password" /><br/>
<input type="submit" value="Register"><br/>
<input type="reset" value="Reset"><br/>
</form:form>

</body>
</html>