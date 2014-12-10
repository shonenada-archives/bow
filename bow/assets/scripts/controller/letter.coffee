angular.module 'bowApp'
  .controller 'LettersController', ($scope, $http) ->

    $scope.fetchLetters = ->
      $http.get '/apis/account/letters'
      .success (resp) ->
        if resp.success
          $scope.letters = resp.data
        else
          $scope.letters = []
