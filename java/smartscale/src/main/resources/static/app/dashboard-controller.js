var dashboardController = angular.module('dashboard.controller', []);

dashboardController.controller('DashboardController', [
	'$rootScope', '$scope', '$http',
	f99unction($rootScope, $scope, $http) {
		
		$scope.scales = [];
		
		$scope.getScales = function() {
			$http.get('rest/scales')
				.then(function(response) {
					$scope.scales = response.data;
					for(var i=0; i < $scope.scales.length; i++) {
						var scale = $scope.scales[i];
						scale.labels = [scale.name, "Empty"];
						scale.data = [scale.value, scale.maxValue - scale.value];
					}
					console.log(JSON.stringify($scope.scales));
				}, function(response) {
					
				});
		};
		
		$scope.getScales();
	}
]);