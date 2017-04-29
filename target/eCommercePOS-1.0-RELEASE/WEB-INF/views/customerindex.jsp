<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            <h3><strong>Enter a New Customer</strong></h3> 
            <div>
                <form action=" <c:url value="/customer/newcustomer" /> " method="post">
                    <br> <div><input type="text" name="customerId" placeholder="new Customer's ID" required class="form-control" /></div> 
                    <br> <div><input type="text" name="name" placeholder="Customer Full Name" required class="form-control" /></div>
                    <br> <div><input type="text" name="contactNo" placeholder="Contact No." required class="form-control" /></div>
                    <br> <div><input type="text" name="address" placeholder="Address" required class="form-control" /></div>
                    <br> <div><input type="email" name="email" placeholder="Email ID" required class="form-control" /></div>
                    <br> <div><button type="submit" class="btn btn-lg btn-success" /><span class="glyphicon glyphicon-user"> Add the Customer</span></div>
                </form>
            </div>
            <br><br>

            <table class="table table-bordered table-hover table-hover table-responsive">
                <tr>
                    <th>Customer ID</th>
                    <th>Customer Name</th>
                    <th>Contact No.</th>
                    <th>Address</th>
                    <th>Email ID</th>
                </tr>

                <c:forEach var="customer" items="${customerList}" >
                    <tr>
                        <td>${customer.customerId}</td>
                        <td><strong>${customer.name}</strong></td>
                        <td>${customer.contactNo}</td>
                        <td>${customer.address}</td>
                        <td>${customer.email}</td>
                    </tr>    
                </c:forEach>  

            </table> 




        </div>
    </body>
</html>
