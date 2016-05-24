angular.module('myApp', ['ngMaterial','ui.grid', 'ui.grid.selection'])
    .controller('ProductController', function($scope, $mdMedia, $http) {
        $scope.$mdMedia = $mdMedia;

        var self = this;

        var urlBase="";
        $http.defaults.headers.post["Content-Type"] = "application/json";

        // this.filterBy = "All Products";
        // this.sortedBy = "Featured"
        this.availableFilters = ["All Products", "Meyve Şurupları", "Reçeller", "Zeytin ve Zeytinyağları", "Peynir Çeşitleri ve Tereyağ"];
        this.availableSorts = ["Featured", "Best Selling", "Alphabetically, A-Z", "Alphabetically, Z-A", "Price, low to high", "Price, high to low", "Date, new to old", "Date, old to new"];

        var columnDefs1 = [
            { name: 'Name' },
            { name: 'Price' },
            { name: 'Amount' },
            { name: 'Unit' },
            { name: 'TotalCost' }
        ];

        $scope.myGrid = {
            columnDefs : columnDefs1,
            enableRowSelection: true,
            multiSelect: true,
            enableRowHeaderSelection: false
        }

        $scope.myGrid.onRegisterApi = function(gridApi) {
            $scope.myGridApi = gridApi;
        };
        
        $scope.searchProduct = function searchProduct() {
            // alert($scope.search);
            $scope.result = $scope.search;
        }

        $scope.setActiveItem = function setActiveItem(val) {
            // alert(val.title);
            $scope.selectedItem = val;

            // get productUnit of selectedItem
            $http.get(urlBase + '/productUnits/' + val.unitID).
            success(function (data) {
                var list = [];
                if (data != undefined) {
                    list.push(data.name);
                } else {
                    list = [];
                }

                self.productUnits = list;
            });
        }

        $scope.addToCart = function addToCart() {
            // $scope.result = $scope.selectedItem.title;

            if ($scope.amount != null && $scope.amount > 0) {
                
                $scope.myGrid.data.push({
                    "Name" : $scope.selectedItem.title,
                    "Price" : $scope.selectedItem.price,
                    "Amount" : $scope.amount,
                    "Unit" : self.unitBy,
                    "UnitID" : $scope.selectedItem.unitID,
                    "ProductID" : $scope.selectedItem.productID,
                    "TotalCost" : ($scope.selectedItem.price * $scope.amount)
                })

                $scope.selectedItem = null;
                self.productUnits = [];
                $scope.amount = null;
            }
            
        }
        
        $scope.deleteFromCart = function deleteFromCart() {
            angular.forEach($scope.myGridApi.selection.getSelectedRows(), function (data, index) {
                $scope.myGrid.data.splice($scope.myGrid.data.lastIndexOf(data), 1);
            });
        }

        function sendSaleDetail(request) {
            for (var i=0; i < request.length; i++) {
                if (!request[i].isSent) {
                    request[i].isSent = true;
                    $http.post(urlBase + '/saleDetailss', request[i].value).
                    success(function(data, status, headers) {

                        sendSaleDetail(request);
                    });
                    break;
                }
            }
        }

        $scope.checkOut = function checkOut() {

            var cartTotalCost = 0.0;
            angular.forEach($scope.myGrid.data, function (data, index) {
                cartTotalCost += data.TotalCost;
            });

            var cartDiscountPer = 0.0;
            var cartTotalDiscount = cartTotalCost * cartDiscountPer;
            var cartNetCost = cartTotalCost - cartTotalDiscount;
            var cartDetailCount = $scope.myGrid.data.length;

            $http.post(urlBase + '/saleLists', {
                memberID: 1,
                discountPer: 0,
                totalCost: cartTotalCost,
                totalDiscount: cartTotalDiscount,
                netCost: cartNetCost,
                detailCount: cartDetailCount,
                saleDate: new Date()
            }).
            success(function(data, status, headers) {

                var newSaleListUri = headers()["location"];

                $http.get(newSaleListUri).
                success(function (data) {
                    var saleListID = -1;
                    if (data != undefined) {
                        saleListID = data.id;
                    }

                    if (saleListID > 0) {
                        // saleList added but need to add saleDetails

                        var requestList = [];

                        angular.forEach($scope.myGrid.data, function (data, index) {

                            requestList.push(angular.extend({}, {
                               isSent: false,
                                value: {
                                    salesListID: saleListID,
                                    productID: data.ProductID,
                                    unitID: data.UnitID,
                                    selectedUnit: data.Unit,
                                    amount: data.Amount,
                                    productPrice: data.Price,
                                    totalCost: data.TotalCost
                                }
                            }));
                        });

                        sendSaleDetail(requestList);


                        // $http.post(urlBase + '/saleDetailss', row1).
                        // success(function(data, status, headers) {
                        //
                        //     // alert("Cart successfully checked out.")
                        //
                        //     $http.post(urlBase + '/saleDetailss', row2).
                        //     success(function(data, status, headers) {
                        //
                        //         // alert("Cart successfully checked out.")
                        //
                        //     });
                        //
                        // });

                        // angular.forEach($scope.myGrid.data, function (data, index) {
                        //     $scope.myGrid.data.splice($scope.myGrid.data.lastIndexOf(data), 1);
                        // });

                        for (var i=0; i < $scope.myGrid.data.length; ) {
                            $scope.myGrid.data.splice(i, 1);
                            i = 0;
                        }
                    }
                });
            });


        }

        function makeProducts() {
            // var list = [],
            //     master = {
            //         imageURL: "./img/salca.png",
            //         title: "Kahvaltılık Salça",
            //         price: "22.00TL"
            //     }
            //
            // for (var j = 0; j < 6; j++) {
            //     list.push(angular.extend({}, master));
            // }
            // return list;

            $http.get(urlBase + '/products').
            success(function (data) {
                var list = [];
                if (data._embedded != undefined) {
                    for(var k in data._embedded.products) {
                        console.log(k, data._embedded.products[k].productName);
                        list.push(angular.extend({}, {
                            imageURL: "./img/salca.png",
                            title: data._embedded.products[k].productName,
                            price: data._embedded.products[k].price,
                            unitID: data._embedded.products[k].unitID,
                            productID: data._embedded.products[k].id
                        }))
                    }
                } else {
                    list = [];
                }

                console.log(list);

                self.catalog = list;

                self.filterBy = "All Products";
                self.sortedBy = "Featured"
            });
        }

        makeProducts();
    })
    // .factory('$products', function($http) {
    //     return {
    //         availableFilters: ["All Products", "Meyve Şurupları", "Reçeller", "Zeytin ve Zeytinyağları", "Peynir Çeşitleri ve Tereyağ"],
    //         availableSorts: ["Featured", "Best Selling", "Alphabetically, A-Z", "Alphabetically, Z-A", "Price, low to high", "Price, high to low", "Date, new to old", "Date, old to new"]
    //     };
    //     //http://www.bukoop.org/wp-content/uploads/2015/02/Kahvaltilik-salca.jpg
    //
    // })