'use strict'

angular
  .module 'bowApp', [
    'ngRoute',
    'ngCookies',
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
    .when '/account/profile',
      templateUrl: 'views/account/profile.html'
      controller: 'ProfileController'
    .when '/account/inbox',
      templateUrl: 'views/account/inbox.html',
      controller: 'InboxController',
    .when '/account/letters',
      templateUrl: 'views/account/letters.html',
      controller: 'LettersController',
    .otherwise
      templateUrl: '404.html'
      controller: 'NotFoundController'
  ]
