angular.module 'bowApp'
  .controller 'InboxController', ($scope, Inbox) ->
    $scope.inbox = []

    $scope.fetchInbox = ->
      $scope.inbox = Inbox.all()
