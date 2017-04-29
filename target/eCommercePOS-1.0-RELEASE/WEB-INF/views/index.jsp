<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>POS Home</title>
    </head>


    <script src=" <c:url value="/static/js/jquery.min.js" /> "></script>

    <script src="http://code.jquery.com/jquery.min.js"></script>   
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <script src="https://code.angularjs.org/1.6.1/angular.min.js"></script>   

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <body>
        <div class="container">
            <div ng-app="app">
                <div ng-controller="ctrl">

                    <a href=" <c:url value="/customer" />" target="_blank" class="btn btn-primary"><span class="glyphicon glyphicon-user"> Manage Customers</span></a>
                    <a href=" <c:url value="/product" />" target="_blank" class="btn btn-info"><span class="glyphicon glyphicon-shopping-cart"> Products Catalogue</span></a>
                    <div>
                        <form action=" <c:url value="/newsale" /> " method="post">
                            <br> <div><input type="text" ng-model="productId" name="productId" placeholder="Product ID" required class="form-control" /></div> 
                            <br> <div><input type="text" ng-model="customerId" name="customerId" placeholder="Customer ID" required class="form-control" onchange="isValidCustomer()" /></div>
                            <br> <div><input type="number" ng-model="qty" name="quantity" placeholder="Quantity" required class="form-control" onchange="getNetTotal()" /></div>
                            <br> <div><input type="number" ng-model="nettotal" name="total" placeholder="Total" required class="form-control" readonly/></div>
                            <br> <div><button type="submit" class="btn btn-lg btn-success" /><span class="glyphicon glyphicon-shopping-cart"> Add Sale</span></div>
                        </form>
                    </div>
                </div>
            </div>        

            <br><br>       

            <table class="table table-bordered table-hover table-hover table-responsive">
                <tr>
                    <th>Sale ID</th>
                    <th>Product Name</th>
                    <th>Customer Name</th>
                    <th>Contact</th>
                    <th>Total</th>
                    <th>Date</th>
                </tr>

                <c:forEach var="sale" items="${saleList}" >
                    <tr>
                        <td>${sale.saleId}</td>
                        <td><strong>${sale.productId.name}</strong></td>
                        <td>${sale.customerId.name}</td>
                        <td>${sale.customerId.contactNo}</td>
                        <td>Rs. ${sale.total}</td>
                        <td>${sale.saleDate}</td>
                    </tr>    
                </c:forEach>  
            </table> 

        </div>
    </body>
    <script>
        var app = angular.module('app', []);

        app.controller("ctrl", function ($scope, $http) {

            getNetTotal = function () {
                $http.get("http://localhost:8080/ecommercepos/getTotal/" + $scope.productId + "?quantity=" + $scope.qty).then(function (response) {
                    $scope.nettotal = response.data;
                }
                , function (response) {
                    $scope.nettotal = -1;
                    alert($scope.nettotal);
                });
            };
            
            isValidCustomer = function () {
                $http.get("http://localhost:8080/ecommercepos/customer/isvalidcustomer?customerId=" + $scope.customerId).then(function (response) {
                    $scope.customerValidity = response.data;
                    alert($scope.customerValidity);
                }
                , function (response) {
                    $scope.customerValidity = "Something Went Wrong !!";
                    alert($scope.customerValidity);
                });
            };


        });

    </script>    

</html>
