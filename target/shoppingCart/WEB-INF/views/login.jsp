<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="<c:url value='j_spring_security_check'/>"  method="POST">
       <c:if test="${not empty loginerror}">
       <p class="loginerror" >${loginerror}</p>
       </c:if>
       
       <c:if test="${not empty loginmsg}">
       <p class="loginmsg" >${loginmsg}</p>
       </c:if>
          <h2 style="color:#000000">Please Login</h2>
	     <hr class="colorgraph"> 
        <div class="row">
				<div class="col-sm-12 ">
					<div class="form-group">
						<input style="background-color:#FFFFE0" type="text"  name="username" id="email_id" class="form-control input-lg" placeholder="Name" tabindex="1" />
					</div>
				</div>
			
				
			</div>
			 <div class="row">
				<div class="col-xs-12">
					<div class="form-group">
						<input style="background-color:#FFFFE0" type="password"  name="password" id="password" class="form-control input-lg" placeholder="Password" tabindex="2" />
					</div>
				</div>
			
				
			</div>
			<hr class="colorgraph"> 
 			<div class="row">
				<div class="col-xs-12 col-md-6"><input type="submit" value="Submit" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
				
			</div>

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

			
        </form>
</body>
</html>