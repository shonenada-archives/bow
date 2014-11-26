angular.module 'bowApp'
  .controller 'SignUpController', ($scope, $http, $document, $location, $timeout, $cookies) ->

    $scope.username = ''
    $scope.password = ''
    $scope.email = ''
    $scope.nickname = ''
    $scope.messages = ''

    @_signUp = (username, password, email, nickname) ->
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


    $scope.signUpSubmit = () =>
      if $scope.signupForm.$valid
        @_signUp($scope.username, $scope.password, $scope.email, $scope.nickname)
      else
        $scope.signupForm.username.$dirty = true
        $scope.signupForm.password.$dirty = true
        $scope.signupForm.email.$dirty = true
        $scope.signupForm.nickname.$dirty = true
