<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products Available</title>
    </head>
    <script src="http://code.jquery.com/jquery.min.js"></script>   
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <body>
        <div class="container">
            <a href=" <c:url value="/" />"  class="btn btn-primary"><span class="glyphicon glyphicon-home"> Home</span></a>
            <h3><strong>Enter a New Product That's arrived</strong></h3> 
            <div>
                <form action=" <c:url value="/product/newproduct" /> " method="post">
                    <br> <div><input type="text" name="productId" placeholder="New Product ID" required class="form-control" /></div> 
                    <br> <div><input type="text" name="name" placeholder="Product Name" required class="form-control" /></div>
                    <br> <div><input type="number" name="price" placeholder="Price per piece" required class="form-control" /></div>
                    <br> <div><input type="text" name="type" placeholder="What kind of product ??" required class="form-control" /></div>
                    <br> <div><input type="text" name="description" placeholder="Description" required class="form-control" /></div>
                    <br> <div><input type="text" name="companyId" placeholder="Company ID" required class="form-control" /></div>
                    <br> <div><button type="submit" class="btn btn-lg btn-success" /><span class="glyphicon glyphicon-plus"> Add New Product</span></div>
                </form>
            </div>
            <br><br>

            <table class="table table-bordered table-hover table-hover table-responsive">
                <tr>
                    <th>Product ID</th>
                    <th>Name</th>
                    <th>Price Per Piece</th>
                    <th>Product Type</th>
                    <th>Description</th>
                    <th>Company Name</th>
                </tr>

                <c:forEach var="product" items="${productList}" >
                    <tr>
                        <td>${product.productId}</td>
                        <td><strong>${product.name}</strong></td>
                        <td>Rs. ${product.price}</td>
                        <td>${product.type}</td>
                        <td>${product.description}</td>
                        <td>${product.companyId.name}</td>
                    </tr>    
                </c:forEach>  

            </table> 




        </div>
    </body>
</html>
