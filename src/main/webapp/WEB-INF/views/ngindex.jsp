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

                    <a href=" <c:url value="/customer" />" target="_blank" class="btn btn-primary"><span class="glyphicon glyphicon-user"></span> Manage Customers</a>
                    <a href=" <c:url value="/product" />" target="_blank" class="btn btn-info"><span class="glyphicon glyphicon-shopping-cart"></span> Products Catalogue</a>
                    <br><br>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">
                        <span class="glyphicon glyphicon-plus"></span> Add Sale 
                    </button>
                    <br> <br>      
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
                        <tr ng-repeat = "sale in sales| filter : autoSearch | orderBy: odBy">
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

                    <!-- Modal -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h2 class="modal-title" id="exampleModalLabel">Add a New Sale !!</h2>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div>
                                        <form ng-submit="processForm()" id="newSale-group" class="form-group">
                                            <br> <div><input type="text" ng-model="formData.productId"  name="productId"  placeholder="Product ID" required class="form-control" /></div> 
                                            <br> <div><input type="text" ng-model="formData.customerId" name="customerId" placeholder="Customer ID" required class="form-control" /></div>
                                            <br> <div><input type="number" ng-model="formData.quantity" name="quantity" placeholder="Quantity" required class="form-control" onchange="getNetTotal()" /></div>
                                            <br><strong>Sale Total: </strong> <div><input type="number" ng-model="formData.total" name="total" readonly placeholder="Total" required class="form-control"/></div>
                                            <br> <button type="submit" class="btn btn-success btn-lg btn-block"><span class="glyphicon glyphicon-ok"></span> Save </button>
                                        </form>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger btn-lg" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>  

                </div>
            </div>  
        </div>
    </body>
    <script>
        var app = angular.module('app', []);

        app.controller("ctrl", function ($scope, $http) {
            $scope.sales;
            $scope.formData = {};

            $scope.processForm = function () {
                $http({
                    method: 'POST',
                    url: 'http://localhost:8080/ecommercepos/ngapitest/submitnewsale',
                    data: $.param($scope.formData), // pass in data as strings
                    headers: {'Content-Type': 'application/x-www-form-urlencoded'}  // set the headers so angular passing info as form data (not request payload)
                })
                        .then(function (response) {
                            console.log(response);
                            if (response.data === 1) {
                                alert("Insert Successful");
                                $scope.formData.productId = "";
                                $scope.formData.customerId = "";
                                $scope.formData.quantity = null;
                                $scope.formData.total = null;
                                
                            } else {
                                alert("Did not insert");
                            }
                        }, function (response) {
                            alert("Call not successful !!");
                        });
            };



            $http.get("http://localhost:8080/ecommercepos/api/allsales/").then(function (response) {
                $scope.sales = response.data;
                console.log(response.data);
            }
            , function (response) {
                $scope.sales = null;
                alert("API call failure !!");
            });




            getNetTotal = function () {
                $http.get("http://localhost:8080/ecommercepos/getTotal/" + $scope.formData.productId + "?quantity=" + $scope.formData.quantity).then(function (response) {
                    $scope.formData.total = response.data;
                }
                , function (response) {
                    $scope.formData.total = -1;
                });
            };



        });

    </script>    

</html>
