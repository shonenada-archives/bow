'use strict'

angular
  .module 'bowApp'
  .controller 'IndexController', ($scope, $http, $document, $location, $timeout, CurrentUser) ->
    $scope.showBox = null
    $scope.username = ''
    $scope.password = ''
    $scope.email = ''
    $scope.nickname = ''
    $scope.messages = ''

    @signIn = (username, password) ->
      $http.post '/apis/account/signin',
        username: username
        password: password
      .success (resp) ->
        if resp.success
          $scope.messages = 'SuccessFul'
          $timeout ->
            $location.path '/account/profile'
          , 1000
        else
          $scope.messages = resp.messages.join ','

    @signUp = (username, password, email, nickname) ->
      $http.post '/apis/account/signup',
        username: username
        password: password
        email: email
        nickname: nickname
      .success (resp) ->
        if resp.success
          $scope.messages = 'SuccessFul'
          $timeout () ->
            $location.path '/account/signin'
          , 1000
        else
          $scope.messages = resp.messages.join ','

    $scope.backToTop = ->
      $timeout ->
        $scope.showBox = null
      , 500

    $scope.signInSubmit = () =>
      if $scope.signinForm.$valid
        @signIn($scope.username, $scope.password)
      else
        $scope.signinForm.username.$dirty = true
        $scope.signinForm.password.$dirty = true

    $scope.signUpSubmit = () =>
      if $scope.signupForm.$valid
        @signUp($scope.username, $scope.password, $scope.email, $scope.nickname)
      else
        $scope.signupForm.username.$dirty = true
        $scope.signupForm.password.$dirty = true
        $scope.signupForm.email.$dirty = true
        $scope.signupForm.nickname.$dirty = true
