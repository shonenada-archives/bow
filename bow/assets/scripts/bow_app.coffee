angular.module 'bowApp', [
    'ngRoute',
    'ngCookies',
    'ngMessages',
    'duScroll',
    'common'
  ]
  .config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->

    requireAnonymous = ->
      ['$location', 'CurrentUser', ($location, CurrentUser) ->
        CurrentUser.get().then ->
          $location.path '/account/profile'
        , ->
          {}
      ]

    requireAuth = ->
      ['$location', 'CurrentUser', ($location, CurrentUser) ->
        CurrentUser.get().then (->)
        , ->
          $location.path '/account/signin'
      ]

    $routeProvider
    .when '/',
      templateUrl: 'views/index-main.html'
      controller: 'IndexController'
      resolve:
        currentUser: requireAnonymous()
    .when '/account/signin',
      templateUrl: 'views/account/signin.html'
      controller: 'SignInController'
    .when '/account/signup',
      templateUrl: 'views/account/signup.html'
      controller: 'SignUpController'
    .when '/account/signout',
      template: 'signout'
      controller: 'SignOutController'
      resolve:
        currentUser: requireAuth()
    .when '/account/profile',
      templateUrl: 'views/account/profile.html'
      controller: 'ProfileController'
      resolve:
        currentUser: requireAuth()
    .when '/account/inbox',
      templateUrl: 'views/account/inbox.html',
      controller: 'InboxController',
      resolve:
        currentUser: requireAuth()
    .when '/account/letters',
      templateUrl: 'views/account/letters.html',
      controller: 'LettersController',
      resolve:
        currentUser: requireAuth()
    .otherwise
      templateUrl: '404.html'
      controller: 'NotFoundController'
  ]
