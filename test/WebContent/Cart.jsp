<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><!DOCTYPE html>
<html>

    <head>
        
        <title>test</title>
        
        <!-- BOOTSTRAP -->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <!-- BOOSTRAP END -->
        
        <link rel="stylesheet" href="css/cart.css"/>
        
    </head>
    
    <body>
        
		<!-- NAVIGATION --> 
		<link rel="stylesheet" href="css/nav.css"/>
		        <%@include file="jspf/nav.jspf" %>

		<!-- NAVIGATION END -->
        
        <!-- user bar -->

		
		<!-- user bar end --> 
        
        <!-- MAIN SECTION -->
        
        
        <c:choose>
			  <c:when test="${empty sessionScope.orderedProducts}">
			  	
			  	<div class="cart-empty">
			  		<div class="cart-empty-box">
					    <h4>Your cart is empty.</h4>
					    <a href="Products" class="btn btn-dark">Back to the store</a>
				    </div>
				</div>
				
			  </c:when>
			  
			  <c:otherwise>
			  
				  <form id="cart" class="" method="POST" action="CheckoutController">
				  
				    <div id="items" class="">
	            
		            	<div class="item-list">
			           
							<c:forEach var="orderedProduct" items="${sessionScope.orderedProducts}">
								
								<div class="item">
									<div class="item-param"><img class="prod-img" src="${orderedProduct.imgPath}"></div>
									<div class="item-param item-param-250"><h6><input name="prodName" value="${orderedProduct.name}" readonly></h6></div>
									<div class="item-param item-param-150">Quantity: ${orderedProduct.quantity}</div>
									<div class="item-param item-param-200"><h6>${orderedProduct.getTotalPrice()}LEI</h6></div>
									<div class="item-param"><a class="rmv-prod" href="<c:url value="CheckoutController?prodName=${orderedProduct.name}"/>">x</a></div>
								</div>
											 					
							</c:forEach>
							
						</div>
	            
		           	 </div>
	
		            <c:if test="${not empty sessionScope.orderedProducts}">
							<div class="total">
								<h4>Order summary</h4>
								<div>
									<p class="total-param">Products cost: </p>
									<p class="cost">${sessionScope.total}LEI</p>
								</div>
								<div>
									<p class="total-param">Delivery fee: </p>
									<p class="cost">0LEI</p>
								</div>
								<div class="line"></div>
								<h5>Total:</h5>
								<h4>${sessionScope.total}LEI</h4>
								<button id="checkout-btn" name="checkout" class="btn btn-dark" type="submit">Checkout</button>
							</div>
					</c:if>
					
				  </form>
			
			  </c:otherwise>
		</c:choose>
        
    </body>
    
</html>