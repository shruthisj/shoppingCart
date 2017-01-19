<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>man_sup</title>
</head>
<body>
<h3>Manage Suppliers</h3> 
<%-- <form:form action="supplier_add" commandName="supplier" method="post"> --%>
<%-- Supplier Id:<form:input type="text" path="id" name="id" /><br/> --%>
<%-- Supplier Name:<form:input type="text" path="name" name="name"/><br/> --%>
<%-- Supplier Description:<form:input type="text" path="description" name="decsription" /><br/> --%>
<!-- <input type="submit" value="Add"><br/> -->
<%-- </form:form> --%>
<form:form action="supplier_add" commandName="supplier" method="POST">
<table class="table table-condensed">
	<tr bgcolor=#F0F8FF>
		<td><form:label style="color:#000000" path="id"><spring:message text="id"/></form:label></td>
		
		
		<c:choose>
			<c:when test="${!empty supplier.id}">
				<td><form:input style="background-color:#F5F5DC;border:0.25px solid black" path="id" disabled="true" readonly="true"/></td>
			</c:when>
			<c:otherwise>
				<td><form:input style="background-color:#F5F5DC;border:0.25px solid black" path="id"  pattern=".{4,7}" required="true" title="id should be between 4 to 7 characters"/></td>
				</c:otherwise>
				</c:choose>
				</tr>
				
				<tr bgcolor="#F0F8FF"> 
				<form:input path="id" hidden="true"/>
				
				<td><form:label style="color:#000000" path="name"> <spring:message text="name"/></form:label></td>
        		<td><form:input style="background-color:#F5F5DC;border:0.25px solid black" path="name" required="true" /></td> 
				</tr>
				
				<tr bgcolor="#F0F8FF">
				<td><form:label style="color:#000000" path="description" ><spring:message text="description"/></form:label></td>
				<td><form:input style="background-color:#F5F5DC;border:0.25px solid black" path="description" required="true"/></td>
				</tr>
				
				<tr bgcolor="#F0F8FF">
				<td align="right" colspan="2"><c:if test="${!empty supplier.name}">
									<input style= "align:middle" class="btn btn-primary btn-md" type="submit" value="<spring:message text="Edit Supplier"/>"/>
								</c:if>
								<c:if test="${empty supplier.name}">
									<input style= "align:middle"  class="btn btn-primary btn-md" type="submit" value="<spring:message text="Add Supplier"/>"/>
								</c:if>
				</td>
				</tr>
</table>
</form:form>


	<br />
	<h3>Supplier List</h3>
	<c:if test="${!empty supplierList}">
		<table class="container">
			<tr>
				<th width="40">Supplier Id</th>
				<th width="80">Supplier Name</th>
				<th width="80">Supplier Description</th>
				<th width="50">Edit</th> 
				<th width="50">Delete</th> 
				
			</tr>
			<c:forEach items="${supplierList}" var="supplier">
				<tr>
					<td>${supplier.id}</td>
					<td>${supplier.name}</td>
					<td>${supplier.description}</td>
					<td> <a href="<c:url value='supplier_edit-${supplier.id}'/>">Edit</a></td> 
 			        <td> <a href="<c:url value='supplier_delete-${supplier.id}'/>">Delete</a></td> 
				</tr>
			</c:forEach>
		</table>
	</c:if>

</body>
</html>