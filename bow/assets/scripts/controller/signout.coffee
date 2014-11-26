angular.module 'bowApp'
  .controller 'SignOutController', ($scope, $http, $location, CurrentUser) ->

    $scope.signOut = ->
      $http.post '/apis/account/signout', {}
      .success (resp) =>
        if resp.success
          CurrentUser.signOut()
          $location.path '/'
        else (err) ->
          console.log err

    $scope.signOut()
