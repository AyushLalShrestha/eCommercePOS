<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>POS angular</title>
    </head>

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
                    <br><br>       
                    <label>Order By</label>
                    <select class="dropdown" ng-model="odBy">
                        <option value="Name">Name</option>
                        <option value="productName">Product</option>
                        <option value="customerName">Customer</option>
                    </select>
                    <input class="input-group" type="text" ng-model="autoSearch" placeholder="Search..."  />
                    <br>

                    <table class="table table-bordered table-hover table-hover table-responsive">
                        <tr>
                            <th>Sale ID</th>
                            <th>Customer Name</th>
                            <th>Product Name</th>
                            <th>Price Per Piece</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Date</th>
                            <th>Contact</th>
                        </tr>
                        <tr ng-repeat = "sale in sales | filter : autoSearch | orderBy: odBy">
                            <td>{{sale.saleId}}</td>
                            <td>{{sale.customerName}}</td>
                            <td>{{sale.productName}}</td>
                            <td>{{sale.pricePerPiece}} per Sample</td>
                            <td>{{sale.quantity}}</td>
                            <td>Rs. {{sale.total}}</td>
                            <td>{{sale.saleDate}}</td>
                            <td>{{sale.customerContact}}</td>
                        </tr>

                    </table> 

                </div>
            </div>  
        </div>
    </body>
    <script>
        var app = angular.module('app', []);

        app.controller("ctrl", function ($scope, $http) {
            $scope.sales;
            $http.get("http://localhost:8080/ecommercepos/api/allsales/").then(function (response) {
                $scope.sales = response.data;
                console.log(response.data);
            }
            , function (response) {
                $scope.sales = null;
                alert("API call failure !!");
            });




        });

    </script>    

</html>
