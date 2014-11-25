angular
  .module 'bowApp'
  .controller 'SignInController', ($scope, $http, $document, $location, $timeout, CurrentUser) ->
    $scope.username = ''
    $scope.password = ''
    $scope.messages = ''
    @_signIn = (username, password) ->
      $http.post '/apis/account/signin',
        username: username
        password: password
      .success (data) ->
        if data.success
          $scope.messages = 'SuccessFul'
          $timeout ->
            $location.path '/account/profile'
          , 1000
        else
          $scope.messages = data.messages.join ','

    $scope.signInSubmit = () =>
      if $scope.signinForm.$valid
        @_signIn($scope.username, $scope.password)
      else
        $scope.signinForm.username.$dirty = true
        $scope.signinForm.password.$dirty = true
