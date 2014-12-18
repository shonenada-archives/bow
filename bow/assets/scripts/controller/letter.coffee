angular.module 'bowApp'
  .controller 'LettersController', ($scope, $http) ->

    $scope.fetchLetters = ->
      $http.get '/apis/letters'
      .success (resp) ->
        if resp.success
          $scope.letters = resp.data
          angular.forEach resp.data, (each) ->
            $http.get "/apis/account/#{each.uid}"
            .success (resp) ->
              if resp.success
                each.user = resp.data

            $http.get "/apis/account/#{each.to_id}"
            .success (resp) ->
              if resp.success
                each.target = resp.data
        else
          $scope.letters = []
