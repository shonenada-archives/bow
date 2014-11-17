'use strict'

angular
  .module 'bowApp'
  .controller 'IndexController', ['$scope', ($scope) ->
    $scope.model = 'test'
  ]
