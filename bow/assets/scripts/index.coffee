'use strict'

angular
  .module 'bowApp'
  .controller 'IndexController', ['$scope', '$http', ($scope, $http) ->
    $scope.username = ''
    $scope.password = ''
    $scope.email = ''
    $scope.nickname = ''
    $scope.messages = ''

    $scope.signUpSubmit = () ->
      if $scope.signupForm.$valid
        $http.post '/apis/account/signup', {
          username: $scope.username
          password: $scope.password
          email: $scope.email
          nickname: $scope.nickname
        }
        .success (data) ->
          if data.success
            $scope.messages = 'SuccessFul'
          else
            $scope.messages = data.messages.join ','
      else
        $scope.signupForm.username.$dirty = true
        $scope.signupForm.password.$dirty = true
        $scope.signupForm.email.$dirty = true
        $scope.signupForm.nickname.$dirty = true
  ]
