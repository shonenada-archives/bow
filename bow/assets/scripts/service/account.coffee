'use strict'

angular
  .module 'bowApp'
  .factory 'Account', ['$resource', ($resource) ->
    $resource '/account/:username', {username: @username}, {}
  ]
