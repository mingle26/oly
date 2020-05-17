<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
	<head>
		
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>test</title>

		<link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="css/singcss.css">
		<!-- BOOTSTRAP -->
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
		<!-- BOOSTRAP END -->

	</head>
	<body>
				
	<link rel="stylesheet" href="css/nav.css" />  	
	<%@include file="jspf/nav.jspf" %>
	
     
    <link rel="stylesheet" href="css/register.css" />
    <section class="login">
      <div class="container text-center test">
        <div class="row">
          <div class="col-12">
            <div class="register-card">
              <form action="SignupController" method="post">
                <h1>Register now!</h1>

                <fieldset>
                  <p class="mt-3">First name:</p>
                  <input
                    type="text"
                    id="name"
                    name="firstname"
                    placeholder="First name"
                    required
                  />
                  <br />
                  <p class="mt-3">Last name:</p>
                  <input
                    type="text"
                    id="password"
                    name="lastname"
                    placeholder="Last name"
                    required
                  />
                  <br />
                  <p class="mt-3">Username:</p>
                  <input
                    type="text"
                    id="password"
                    name="username"
                    placeholder="Username"
                    required
                  />
                  <br />
                  <p class="mt-3">Email:</p>
                  <input
                    type="text"
                    id="password"
                    name="email"
                    placeholder="Email"
                    required
                  />
                  <br />
                  <p class="mt-3">Password:</p>
                  <input
                    type="password"
                    id="password"
                    name="password"
                    placeholder="Password"
                    required
                  />
                  <br />
                  <p class="mt-3">Confirm Password:</p>
                  <input
                    type="password"
                    id="password"
                    name="repassword"
                    placeholder="Password"
                    required
                  />

                  <c:forEach var="error" items="${requestScope.errors}">
                    <p class="error">${error}</p>
                  </c:forEach>
                </fieldset>

                <button class="mt-3" type="submit"><span>Register</span></button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>

	</body>
</html>