angular.module 'bowApp'
  .controller 'SignInController', ($scope, $http, $document, $location, $timeout, CurrentUser) ->
    $scope.username = ''
    $scope.password = ''
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

    $scope.signInSubmit = () =>
      if $scope.signinForm.$valid
        @signIn($scope.username, $scope.password)
      else
        $scope.signinForm.username.$dirty = true
        $scope.signinForm.password.$dirty = true
