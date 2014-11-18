'use strict'

angular
  .module 'bowApp', [
    'ngRoute',
    'ngMessages',
    'duScroll'
  ]
  .config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
    $routeProvider.when '/',
      templateUrl: 'views/index-main.html',
      controller: 'IndexController'
  ]
