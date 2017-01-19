<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>man_pro</title>
</head>
<body>

	<h3>Manage Products</h3>


<form:form action="product_add" commandName="product" method="POST">
<table class="table table-condensed">
	<tr bgcolor=#F0F8FF>
		<td><form:label style="color:#000000" path="id"><spring:message text="id"/></form:label></td>
		
		
		<c:choose>
			<c:when test="${!empty product.id}">
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
				<td><form:label style="color:#000000" path="price"> <spring:message text="price"/></form:label></td>
        		<td><form:input style="background-color:#F5F5DC;border:0.25px solid black" path="price" required="true" /></td> 
				</tr>
				
				<tr bgcolor="#F0F8FF"> 
			    <td><form:label style="color:#000000" path="category.name"> <spring:message text="CategoryList" /></form:label></td>
        		<td><form:select path="category.name" items="${categoryList}" itemValue="name" itemLabel="name"/></td> 
				</tr>
				
				<tr bgcolor="#F0F8FF"> 
				<td><form:label style="color:#000000" path="supplier.name"> <spring:message text="supplier_name"/></form:label></td>
        		<td><form:select path="supplier.name" items="${supplierList}" itemLabel="name" itemValue="name"/></td> 
				</tr>
				
				
				<tr bgcolor="#F0F8FF"> 
				<td><form:label style="color:#000000" path="stock"> <spring:message text="stock"/></form:label></td>
        		<td><form:input style="background-color:#F5F5DC;border:0.25px solid black" path="stock" required="true" /></td> 
				</tr>
				
				
				
				
				<tr bgcolor="#F0F8FF">
				<td align="right" colspan="2"><c:if test="${!empty product.name}">
									<input style= "align:middle" class="btn btn-primary btn-md" type="submit" value="<spring:message text="Edit Product"/>"/>
								</c:if>
								<c:if test="${empty product.name}">
									<input style= "align:middle"  class="btn btn-primary btn-md" type="submit" value="<spring:message text="Add Product"/>"/>
								</c:if>
				
</table>
</form:form>


	<br />
	<h3>Product List</h3>
	<c:if test="${!empty productList}">
		<table class="container">
			<tr>
				<th width="40">Product Id</th>
				<th width="80">Product Name</th>
				<th width="80">Product Description</th>
				<th width="80">Product Price</th>
				<th width="80">Product Category-Id</th>
				<th width="80">Product Supplier-Id</th>
				<th width="80">Product Stock</th>
				<th width="50">Edit</th> 
				<th width="50">Delete</th> 
				
			</tr>
			<c:forEach items="${productList}" var="product" >
				<tr>
					<td>${product.id}</td>
					<td>${product.name}</td>
					<td>${product.description}</td>
					<td>${product.price}</td>
					<td>${product.category_id}</td>
					<td>${product.supplier_id}</td>
					<td>${product.stock}</td>
					
					<td> <a href="<c:url value='product_edit-${product.id}'/>">Edit</a></td> 
 			        <td> <a href="<c:url value='product_delete-${product.id}'/>">Delete</a></td> 
				</tr>
			</c:forEach>
		</table>
	</c:if>

<%-- <c:forEach items="${categoryList}" var="category">  --%>
<%-- <c:out value="${category}"/> --%>
<%-- </c:forEach> --%>

</body>
</html>