'use strict'

angular
  .module 'bowApp'
  .controller 'IndexController', ['$scope', ($scope) ->
    $scope.model = 'test'

    $scope.signUpSubmit = () ->
      null
  ]
