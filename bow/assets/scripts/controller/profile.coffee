angular
  .module 'bowApp'
  .controller 'ProfileController', ($scope, CurrentUser) ->
    $scope.currentUser = CurrentUser
