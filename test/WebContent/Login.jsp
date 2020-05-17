<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/jspf/header.jspf" %>
    </head>
    <body>

        <%@include file="/jspf/nav.jspf" %>
    <link rel="stylesheet" href="css/nav.css" />   
    <link rel="stylesheet" href="css/login.css" />
    <section class="login">
      <div class="container text-center test">
        <div class="row">
          <div class="col-12">
            <div class="login-card">
              <form action="LoginController" method="post">
                <h1>Login now!</h1>

                <fieldset>
                  <p class="mt-3">Enter username!</p>
                  <input
                    type="text"
                    id="name"
                    name="username"
                    placeholder="Username"
                    required
                  />
                  <br />
                  <p class="mt-3">Enter password!</p>
                  <input
                    type="password"
                    id="password"
                    name="password"
                    placeholder="Password"
                    required
                  />

                  <c:forEach var="error" items="${requestScope.errors}">
                    <p class="error">${error}</p>
                  </c:forEach>
                </fieldset>

                <button class="mt-3" type="submit">Login</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>

    </body>
</html>