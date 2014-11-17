'use strict'

angular
  .module 'bowApp', [
    'ngRoute',
    'ngMessages'
  ]
  .config ['$routeProvider', ($routeProvider) ->
    $routeProvider.when '/',
      templateUrl: 'views/index-main.html',
      controller: 'IndexController'
  ]
