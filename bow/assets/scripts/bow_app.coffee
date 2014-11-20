'use strict'

angular
  .module 'bowApp', [
    'ngRoute',
    'ngMessages',
    'duScroll'
  ]
  .config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
    $routeProvider
    .when '/',
      templateUrl: 'views/index-main.html'
      controller: 'IndexController'
    .when '/account/signin',
      templateUrl: 'views/account/signin.html'
      controller: 'SignInController'
    .when '/account/signup',
      templateUrl: 'views/account/signup.html'
      controller: 'SignUpController'
  ]
