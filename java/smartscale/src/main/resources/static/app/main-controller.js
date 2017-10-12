var mainController = angular.module('main.controller', []);

mainController.controller('MainController', [
	'$rootScope', '$scope',
	function($rootScope, $scope) {
		$scope.options = {
			    chart: {
			        type: 'discreteBarChart',
			        height: 200,
			        margin : {
			            top: 20,
			            right: 20,
			            bottom: 60,
			            left: 55
			        },
			        x: function(d){ return d.label; },
			        y: function(d){ return d.value; },
			        showValues: true,
			        valueFormat: function(d){
			            return d3.format(',.4f')(d);
			        },
			        transitionDuration: 500,
			        xAxis: {
			            axisLabel: 'X Axis'
			        },
			        yAxis: {
			            axisLabel: 'Y Axis',
			            axisLabelDistance: 30
			        }
			    }
			};
		
		$scope.data = [{
		    key: "Cumulative Return",
		    values: [
		        { "label" : "B" , "value" : 0 },
		        { "label" : "C" , "value" : 32.807804682612 },
		        { "label" : "D" , "value" : 196.45946739256 },
		        { "label" : "E" , "value" : 0.19434030906893 }
		    ]
		}];
	}
]);