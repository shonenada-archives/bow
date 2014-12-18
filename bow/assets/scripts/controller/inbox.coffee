angular.module 'bowApp'
  .controller 'InboxController', ($scope, $http) ->

    $scope.fetchInbox = ->
      $http.get '/apis/letters/inbox'
      .success (resp) ->
        if resp.success
          $scope.inbox = resp.data
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
          $scope.inbox = []
