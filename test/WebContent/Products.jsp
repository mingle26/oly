<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

    <head>
        
        <title>test</title>
        
        <!-- BOOTSTRAP -->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <!-- BOOSTRAP END -->
        

        
    </head>
    
    <body>
        
        <%@include file="jspf/nav.jspf" %>
        <link rel="stylesheet" href="css/nav.css" />
        
		
        <!-- start search -->
    <link rel="stylesheet" href="css/product.css" />
    <section class="searchbar">
      <div class="container text-center">
        <div class="row">
          <div class="col-10">
          <form action="SearchController" method="POST">
            <input
              type="text"
              name="searchVal"
              id=""
              placeholder="Search..."
              class="search"
            />
          </div>
          <div class="col-1">
              <input type="submit" name="submit" class="btn btn-primary" value="Search">
			</form>
            </a>
          </div>
          <div class="col-1">
				<%@include file="jspf/userbar.jspf" %>
          </div>
        </div>
      </div>
    </section>
    <!-- end search -->




    <!-- start products -->
    <section id="main">
        
        <div id="products" class="container text-center">
        
        <c:if test = "${empty sessionScope.Products}" >
        
             <row class="row">
                <c:forEach var="product" items="${applicationScope.products}">                  
                                <div class="product col-lg-4">
                                    <div class="card product-body">
                                        <img src="${product.imgPath}"> 
                                        <form class="card-body product-body" method="POST" action="BuyController">
                                            <input name="name" readonly value="${product.name}" style="border:none">
                                            <textarea name="description" style="border:none" readonly>${product.description}</textarea>
                                            <input name="price" readonly value="${product.price}" style="border:none">

                                           	<label for="quantity">Quantity: </label>
                                            <select name="quantity" id="quantity">
                                                 <option value="1">1</option>
                                                 <option value="2">2</option>
                                                 <option value="3">3</option>
                                            </select>
                                            <br>
                                        <input name ="submit" type="submit" class="btn btn-primary" value="Add to cart">
                                        </form> 
                                    </div>
                                </div>
                </c:forEach>
			  </row>
           </c:if>
        
        </div>
        
        
           <row class="row">
                <c:forEach var="product" items="${sessionScope.Products}">                  
                                <div class="product col-lg-4">
                                    <div class="card product-body">
                                        <img src="${product.imgPath}"> 
                                        <form class="card-body product-body" method="POST" action="BuyController">
                                            <input name="name" readonly value="${product.name}" style="border:none">
                                            <textarea name="description" style="border:none" readonly>${product.description}</textarea>
                                            <input name="price" readonly value="${product.price}" style="border:none">

                                           	<label for="quantity">Quantity: </label>
                                            <select name="quantity" id="quantity">
                                                 <option value="1">1</option>
                                                 <option value="2">2</option>
                                                 <option value="3">3</option>
                                            </select>
                                            <br>
                                        <input name ="submit" type="submit" class="btn btn-primary" value="Add to cart">
                                        </form> 
                                    </div>
                                </div>
                </c:forEach>
            </row>
    
    </section>
    <!-- end products -->
        
        <section id="footer">
        
        
       
        </section>
        
    </body>
    
</html>