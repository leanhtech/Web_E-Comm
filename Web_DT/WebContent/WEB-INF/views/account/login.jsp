<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/menu.jsp"%>
<div class="limiter">
	<div class="container-login100">
		<c:if test="${not empty authen}">
			<div class="col-sm-8 alert alert-danger alert-dismissible" role="alert">
				Bạn cần đăng nhập để thực hiện chức năng này!
				<button type="button" class="rem" data-dismiss="alert" aria-label="Close">&times;</button>
			</div>
		</c:if>
		<div class="row mb-4 px-3"> 
			<a style="text-decoration: none;" href="login.htm?language=en"><img width="30px" height="30px" src="<c:url value='/resources/images/english.jpg' />" > English</a> &nbsp;|  &nbsp;<a style="text-decoration: none;" href="login.htm?language=vi"><img width="30px" height="30px" src="<c:url value='/resources/images/vietnam-icon.png' />" >Vietnamese</a> 
		</div>
		<div class="wrap-login100">			
			<form:form action="login.htm" method="post" modelAttribute="user" class="login100-form validate-form">
				<span class="login100-form-logo"> <i
					class="fas fa-shopping-bag" style="color: #7579ff;"></i>
				</span>
				
				
				<span class="login100-form-title py-4"><s:message code="login.DangNhap.title" /></span>
				<h6 style="color: #000000; font-style: italic; padding-top: 15px;">${message}</h6>
				<div class="wrap-input100 validate-input"
					data-validate="Enter username">
					<s:message code="login,TenDangNhap.placehodler"  var="placeholderTenDangNhap"/>
					<form:input class="input100" type="text" path="username" placeholder="${placeholderTenDangNhap }" required="true" />
					<label class="mb-1">
						<form:errors path="username" cssClass="errorss" />
					</label>
				</div>

				<div class="wrap-input100 validate-input"
					data-validate="Enter password">
					<s:message code="login.Password.placeholder"  var="placeholderPassword"/>
					<form:input class="input100" type="password" path="password" placeholder="${placeholderPassword }" required="true" />
					<label class="mb-1">
						<form:errors path="password" cssClass="errorss" />
					</label>
				</div>

				<div class="container-login100-form-btn">
					<button type="submit" class="login100-form-btn"><s:message code="login.Button.title" /></button>
				</div>

				<div class="text-center pt-5">

					<a class="txt1 pe-1" href="home.htm"><s:message code="login.Home.title" /></a>
					<a class="txt1 pe-1" href="forgotPassword.htm"><s:message code="login.ForgetPassword.title" /></a><br/>
					<a class="txt1 ps-1" href="register.htm"><s:message code="login.Register.title" /></a> 

				</div>
			</form:form>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>