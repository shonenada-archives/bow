angular.module 'bowApp'
  .controller 'SendController', ($scope, $location, $http, $timeout) ->
    $scope.sendTo = ''
    $scope.content = ''
    $scope.messages = ''

    sendLetter = ->
      $http.post '/apis/account/send',
        send_to: $scope.sendTo
        content: $scope.content
      .success (resp) ->
        if resp.success
          $scope.messages = 'Success'
          $timeout ->
            $loaction.path '/apis/account/letters'
          , 1000
        else
          $scope.messages = resp.messages.join ','

    $scope.SendSubmit = ->
      if $scope.sendForm.$valid
        sendLetter()
      else
        $scope.sendForm.username.$dirty = true
        $scope.sendForm.content.$dirty = true
