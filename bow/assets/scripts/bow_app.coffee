'use strict'

angular
  .module 'bowApp', [
    'ngRoute'
  ]
  .config ['$routeProvider', ($routeProvider) ->
    $routeProvider.when '/',
      templateUrl: 'views/index-main.html',
      controller: 'IndexController'
  ]
