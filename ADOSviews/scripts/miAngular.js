var marcadores=[];
var marcadores1=[];
var documentos=[];
var data1={};
var datac={};
var datap={};
var r=1;
var term=[{nombre:"Bastilla",precio:10},{nombre:"Ojillos",precio:15},{nombre:"Alma de soga",precio:20},{nombre:'Espacio para tensar',precio:25}];
var id_cliente;
var app= angular.module('TodoApp',[]);

app.directive('fileModel', function ($parse) {
            return {
               restrict: 'A',
               link: function(scope, element, attrs) {
                  var model = $parse(attrs.fileModel);
                  var modelSetter = model.assign;
                  
                  element.bind('change', function(){
                     scope.$apply(function(){
                        modelSetter(scope, element[0].files[0]);
                     });
                  });
               }
            };
         });
      
         app.service('fileUploadService', function ($http, $q) {
 
        this.uploadFileToUrl = function (file, uploadUrl) {
            //FormData, object of key/value pair for form fields and values
            var fileFormData = new FormData();
            fileFormData.append('file', file);
 
            var deffered = $q.defer();
            $http.post(uploadUrl, fileFormData, {
                transformRequest: angular.identity,
                headers: {'Content-Type': undefined}
 
            }).success(function (response) {
                deffered.resolve(response);
 
            }).error(function (response) {
                deffered.reject(response);
            });
 
            return deffered.promise;
        }
    });

	app.controller('FuncionesTodo', function ( $timeout,$filter,$scope,$http,$window,$compile,fileUploadService) {

	// body...
	$scope.selclie;
	$scope.selects;
	$scope.terminados=term;
	$scope.vista=[];
	$scope.empleados = {};
	$scope.ordenes={};
	$scope.ordenprod={};
	$scope.empleadoslist = {};
	$scope.myFile;
	$scope.productos = {};
	$scope.producs = {};
	$scope.clientes=[];
	$scope.documento={};
	$scope.debug={};
	$scope.host='http://localhost/ados/';
	$scope.host1='http://localhost/ados/index.php/clientes/clientes/';
	$scope.host2='http://localhost/ados/index.php/login/login/';
	$scope.host3='http://localhost/ados/index.php/productos/productos/';
	$scope.host4='http://localhost/ados/index.php/ordenes/imagen/';
	$scope.host5='http://localhost/ados/index.php/ordenes/ordenes/';
	$scope.host6='http://localhost/ados/index.php/ordenprod/ordenprod/';
	$scope.host7='http://localhost/ados/index.php/vista/vista/';
	$scope.host8='http://localhost/ados/index.php/productos/borrarProd/';
	$scope.host9='http://localhost/ados/index.php/productos/editar/';
		$scope.listarOrden=function() {
		// body...
		$http.get($scope.host7, $scope.vista)
		.then(function (response) {
			
			if  (response.data != null ){
				//console.log(response.data.Empleados);
				
				$scope.vista= response.data.vistaorden;
				

				window.alert('Acceso a Empleados')
				
			} 

				else {
				console.log('respose without data!!!');
			}
		});
	}
	$scope.getIdCl=function (id_cliente) {
		// body...
		console.log(id_cliente);
              datac = {"id_cliente":id_cliente};
	}
	$scope.getIdPr=function (id_producto) {
		// body...
		console.log(id_producto);
              datap = {"id_producto":id_producto};
	}
	$scope.genOrden=function () {
		$scope.ordenes.id_emp=JSON.parse($window.localStorage.getItem('id'));
		$scope.ordenes.id_clien=datac.id_cliente;
		//body
		$http.post($scope.host5, $scope.ordenes)
		.then(function (response) {
			if (response.data !=null){
				$scope.ordenes=response.data;
				
				 	$window.alert('Orden Registrada');
				 	$window.localStorage.setItem('idorden',response.data.id_orden);
				 	$window.alert(response.data.id_orden);
				 	//$window.location = 'ordenes.html';
				 	$scope.ordenprod.id_orden=JSON.parse($window.localStorage.getItem('idorden'));
		$scope.ordenprod.id_producto=datap.id_producto;
		//body
		$http.post($scope.host6, $scope.ordenprod)
		.then(function (response) {
			if (response.data !=null){
				$scope.ordenprod=response.data;
				
				 	$window.alert('Ordenes Registrada');
				 	$window.location = 'ordenes.html';
			} else{
				$scope.response = { 'response' : 'no hay respuesta'};
				$window.alert('Verifica los datos');

			}
			
		});
			} else{
				$scope.response = { 'response' : 'no hay respuesta'};
				$window.alert('Verifica los datos');
			}
		});

	};

	$scope.uploadFile = function(){
               var file = $scope.myFile;
            var uploadUrl = $scope.host4, //Url of webservice/api/server
                promise = fileUploadService.uploadFileToUrl(file, uploadUrl);
 
            promise.then(function (response) {
                $scope.serverResponse = response;
            }, function () {
                $scope.serverResponse = 'An error has occurred';
            })
            };
	$scope.agregarEmp=function(){
		$http.post($scope.host, $scope.empleados)
		.then(function (response) {
			if (response.data !=null){
			
				$scope.empleados= response.data;
				
				 	$window.alert('Usuario Registrado');
				 	$window.location = 'Login.html';
     

			} else{
				$scope.response = { 'response' : 'no hay respuesta'};
			}
			
		});



	}
			
	$scope.agregarProd=function(){
		$http.post($scope.host3, $scope.productos)
		.then(function (response) {
			if (response.data !=null){
				$scope.productos= response.data;
				
				 	$window.alert('Producto Registrado');
				 	$window.location = 'Agregar_productos.html';
     

			} else{
				$scope.response = { 'response' : 'no hay respuesta'};
			}
			
		});

	}
		$scope.listarEmp=function() {
		// body...
		$http.get($scope.host, $scope.empleados)
		.then(function (response) {
			
			if  (response.data != null ){
				//console.log(response.data.Empleados);
				
				$scope.empleados= response.data.empleados;
				

				window.alert('Acceso a Empleados')
				
			} 

				else {
				console.log('respose without data!!!');
			}
		});
	}

	$scope.listarClien=function() {
		// body...
		$http.get($scope.host1, $scope.clientes)
		.then(function (response) {
			
			if  (response.data != null ){
				//console.log(response.data.Empleados);
				
				$scope.clientes= response.data.clientes;
				$window.alert('Acceso a clientes');
				
				
				$window.alert(id_cliente);
				
			} 

				else {
				console.log('respose without data!!!');
			}
		});
	}
			$scope.agClientes=function(){
		$http.post($scope.host1, $scope.clientes)
		.then(function (response) {
			if (response.data !=null){
				$scope.clientes= response.data;
				
				 	$window.alert('Cliente Registrado');
				 	$window.location = 'Agregar_clientes.html';
     

			} else{
				$scope.response = { 'response' : 'no hay respuesta'};
			}
			
		});



	}
	$scope.listarProd=function() {
		// body...
		$http.get($scope.host3, $scope.productos,$scope.terminados)
		.then(function (response) {
			
			if  (response.data != null ){
				//console.log(response.data.Empleados);
				
				$scope.productos= response.data.productos;
				$window.alert('Listaremos los productos disponibles');
			
			} 

				else {
				console.log('respose without data!!!');
			}
		});

	}
				 
	$scope.borrarProd = function (id_producto) {
          console.log(id_producto);
              var data = {
               id_producto: id_producto,
              };
          console.log(data);
          //llamar la funcion
          $http.post($scope.host8, JSON.stringify(data)).then(function (response) {
            console.log(response.data);

            if (response.data) {
              if(response.data.error == 'false') {
                }
              $scope.message = response.data.message;
              	$window.alert('Registro Borrado');
                console.log("Refrescar");
                 $window.location.href = 'Modificar_Producto.html';
            }
          },
        function (response) {
          $scope.message = response.data.message;
        });
}
	$scope.getIdProd=function (id_producto) {
		// body...
		console.log(id_producto);
              data1 = {"id_producto":id_producto};
	}

	$scope.editarProd = function () {
          
          console.log(data1);
          $scope.producs.id_producto=data1.id_producto;
          //llamar la funcion
          $http.post($scope.host9, $scope.producs).then(function (response) {
            console.log(response.data);
			if (response.data !=null){
				
				$scope.producs= response.data;
				
				 	$window.alert('Producto Modificado');
				 	$window.location = 'Modificar_Producto.html';
     				$scope.message = response.data.message;

			} else{
				$scope.response = { 'response' : 'no hay respuesta'};
			}

           
              
          },
        function (response) {
          $scope.message = response.data.message;
        });
}

	 $scope.login = function(){
                    $http.post($scope.host2, $scope.empleados).then(function(response){
                        if(response.data != null){
                            console.log(response.data);
                           // $scope.orden=response.data.id_usuario;
                        $window.localStorage.setItem('usuario', $scope.empleados.usuario);
						$window.localStorage.setItem('id', response.data.id_usuario);
                        $window.alert('Bienvenido: '+ $scope.empleados.usuario);
                        $window.alert('Bienvenido: '+ response.data.id_usuario);
                        $window.location = 'ordenes.html';	

                        } else {
                            console.log('No hay respuesta!');
                            $window.alert('Verifica tus datos');
                       
                        }
                    });
 
                }

                $scope.printSession = function(){
                   
                    $scope.debug.usuario = $window.localStorage.getItem('usuario');
                    
                }

                $scope.logout = function(){
                    $scope.debug = {};
                    $window.localStorage.clear();
                    $window.location = 'Login.html';
                    $window.alert("Hasta Luego");
                }

			});
