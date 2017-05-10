<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>POS angular</title>
    </head>

    <script src="<c:url value="/static/js/jquery.min.js" />"></script>   
    <script src="<c:url value="/static/js/bootstrapjs/bootstrap.min.js" />" ></script>
    <script src="<c:url value="/static/js/angularjs/angular.min.js" />"></script>   
    <link rel="stylesheet" href=" <c:url value="/static/css/bootstrap.min.css" /> " />
    <link rel="stylesheet" href=" <c:url value="/static/css/bootstrap-theme.min.css" />"   />

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
                    <select class="dropdown" ng-model="odBy" class="dropdown dropdown-menu">
                        <option value="saleDate">Date</option>
                        <option value="customerName">Name</option>
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

        app.service("getSalesService", function ($http) {
            this.getAllSales = function () {
                return $http.get("http://localhost:8080/ecommercepos/api/allsales/");
            };


        });

        app.controller("ctrl", function ($scope, $http, getSalesService) {

            $scope.formData = {};
            alert("Controller Loaded");

            getSalesService.getAllSales().then(function (response) {
                $scope.sales = response.data;
                console.log(response.data);
            }
            , function (response) {
                $scope.sales = null;
                alert("API call failure !!");
            });




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





            getNetTotal = function () {
                $http.get("http://localhost:8080/ecommercepos/getTotal/" + $scope.formData.productId + "?quantity=" + $scope.formData.quantity).then(function (response) {
                    $scope.formData.total = response.data;
                }
                , function (response) {
                    $scope.formData.total = -1;
                    console.log(response.data);
                });
            };



        });

    </script>    

</html>
