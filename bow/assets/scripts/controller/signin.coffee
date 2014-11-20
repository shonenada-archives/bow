'use strict'

angular
  .module 'bowApp'
  .controller 'SignInController', ['$scope', '$http', '$document', '$location', '$timeout', ($scope, $http, $document, $location, $timeout) ->
    $scope.username = ''
    $scope.password = ''
    $scope.messages = ''

    $scope.signInSubmit = () ->
      if $scope.signinForm.$valid
        $http.post '/apis/account/signin', {
          username: $scope.username
          password: $scope.password
        }
        .success (data) ->
          if data.success
            $scope.messages = 'SuccessFul'
            $timeout ->
              $location.path '/account/profile'
            , 1000
          else
            $scope.messages = data.messages.join ','
      else
        $scope.signinForm.username.$dirty = true
        $scope.signinForm.password.$dirty = true
  ]
