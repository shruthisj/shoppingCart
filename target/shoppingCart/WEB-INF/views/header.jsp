<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>




<!DOCTYPE html>
<html>
<head>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}

li a, .dropbtn {
    display: inline-block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
    background-color: red;
}

li.dropdown {
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
    
    .lang {
    right: 0;
}
  
 
    
    
    
    
}
</style>
</head>
<body>

<ul>
  <li><a href="#home">Home</a></li>
  <li class="dropdown">
    <a href="#" class="dropbtn">Authors</a>
    <div class="dropdown-content">
      <a href="#">Aarundati Roy</a>
      <a href="#">chetan bhagat</a>
      <a href="#"> Amish Tripathi</a>
    </div>
    <li class="dropdown">
    <a href="#" class="dropbtn">Publishers</a>
    <div class="dropdown-content">
      <a href="#">DreamLand Publications</a>
      <a href="#">Disha Publications</a>
      <a href="#">Ramesh Publications</a>
       </div>
      <li class="dropdown">
    <a href="#" class="dropbtn">Categories</a>
    <div class="dropdown-content">
      <a href="#">Cook Books</a>
      <a href="#">School,College References</a>
      <a href="#">Children Books</a>
      <a href="#">Competative Exams</a>
      <a href="#">Fiction</a>
      <a href="#">Non-Fiction</a>
       </div>
      <li class="dropdown" >
    <a href="#" class="dropbtn">Languages</a>
    <div class="dropdown-content">
      <a href="#">Hindi</a>
      <a href="#">Kannada</a>
      <a href="#">English</a>
      <a href="#">Marathi</a>
      </div>




    

<li class="divider-vertical"></li>
       <c:if test="${pageContext.request.userPrincipal.name != null}">
      <c:if test="${pageContext.request.userPrincipal.name != 'shruthisjarali@gmail.com'}">
      <li><a  href="<c:url value="/myCart" />"><span class="glyphicon glyphicon-shopping-cart"></span> CART</a>${cartSize}</li>
      </c:if>
      <c:if test="${pageContext.request.userPrincipal.name  == 'shruthisjarali@gmail.com'}">
       <li><a style="color:#F5F5DC" href="<c:url value="/admin" />">VIEW ALL</a></li>
       </c:if>
       <li><a style="color:#F5F5DC">HELLO, ${pageContext.request.userPrincipal.name}</a></li>
       <li><a  style="color:#F5F5DC;margin:0px 0px 0px 0px" href="<c:url value="/j_spring_security_logout" />"> <span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
       </c:if>
      
       
       
        <c:if test="${pageContext.request.userPrincipal.name  == null}">
       <li><a  style="color:#F5F5DC;margin:0px 0px 0px 0px" href="<c:url value="/login" />"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
       <li><a  style="color:#F5F5DC;margin:0px 0px 0px 0px" href="<c:url value="register" />"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
       </c:if>
       <li><a style="color:#F5F5DC" style="float:right" href="aboutUs">Contact Us</a></li>
  </li>
</ul>



</body>
</html>
