<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-9 col-sm-9">
		<h1>Register</h1>
		<div class="content-form-page">
			<div class="row">
				<c:if test="${alert != null}">
					<h3 class="alert alert danger">${alert}</h3>
				</c:if>
				<div class="col-md-7 col-sm-7">
					<form action="/btweb/register" method="post" role="form">
						<div class="form-group">
							<label for="fullname" class="col-lg-4 control-label">Fullname
								<span class="require">*</span>
							</label>
							<div class="col-lg-8">
								<input type="text" class="form-control" name="fullname"
									id="fullname">
							</div>
						</div>
						<div class="form-group">
							<label for="username" class="col-lg-4 control-label">Username
								<span class="require">*</span>
							</label>
							<div class="col-lg-8">
								<input type="text" class="form-control" name="uname"
									id="username">
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-lg-4 control-label">Email
								<span class="require">*</span>
							</label>
							<div class="col-lg-8">
								<input type="text" class="form-control" name="email"
									id="email">
							</div>
						</div>
						<div class="form-group">
							<label for="phone" class="col-lg-4 control-label">Phone <span
								class="require">*</span></label>
							<div class="col-lg-8">
								<input type="text" class="form-control" name="phone" id="phone">
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-lg-4 control-label">Password
								<span class="require">*</span>
							</label>
							<div class="col-lg-8">
								<input type="password" class="form-control" name="psw"
									id="password">
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-lg-4 control-label">Re-enter
								password <span class="require">*</span>
							</label>
							<div class="col-lg-8">
								<input type="password" class="form-control" name="psw-repeat"
									id="password">
							</div>
						</div>
						<div class="row">
							<div class="row">
								<div
									class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-20">
									<p>
										By creating an account you agree to our <a href="#">Terms
											& Privacy</a>.
									</p>
								</div>
							</div>
							<div class="row">
								<div
									class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-20">
									<button type="submit" class="btn btn-primary">Register</button>
								</div>
							</div>
							<div class="row">
								<div
									class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-20">
									<p>
										Already have an account? <a href="/btweb/login">Sign in</a>.
									</p>
								</div>
							</div>
						</div>

						<div class="container signin"></div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>