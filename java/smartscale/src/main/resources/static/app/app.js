var mainApp = angular.module('mainApp', ['ui.router', 'ui.bootstrap', 'main.controller', 'nvd3']);

mainApp.config(['$stateProvider', '$urlRouterProvider',
	function($stateProvider, $urlRouterProvider) {
		
		$urlRouterProvider.otherwise("/");
	
		$stateProvider
			.state('main', {
				url: "/",
				templateUrl: 'partials/dashboard.html',
				controller: 'MainController'
			});
	}
]).run(function($rootScope) {
	$rootScope.isToggled = true;
	
	$rootScope.toggle = function() {
		$rootScope.isToggled = !$rootScope.isToggled;
	};
});