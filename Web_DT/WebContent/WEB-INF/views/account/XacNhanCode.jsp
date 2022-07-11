<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/menu.jsp"%>
<form:form action="XacNhanCode.htm" method="post" >
<div class="limiter">
		<div class="container-login100">	
			<div class="wrap-login100">
				<form class="login100-form validate-form">
					<span class="login100-form-title">
						<h1>Xác nhận code</h1>
						<h6 style="color: #000000; font-style: italic; padding-top: 15px;">${message}</h6>
					</span>
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="email" name="email" placeholder="Nhập Email" value="${email}"/> 
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="username" placeholder="Nhập Username" value="${username}"/> 
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							
						</span>
					</div>				

                    <div class="wrap-input100 validate-input" data-validate = "Code is required">
						<input class="input100" type="password" name="code" placeholder="Nhập code"/> 
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							
						</span>
					</div>

                    <div class="container-login100-form-btn">
						<input type="submit" value ="Xác nhận" class="forgot-button" />
						
					</div>									
				</form>
			</div>
		</div>
	</div>
	</form:form>

<%@include file="/WEB-INF/views/include/footer.jsp"%>