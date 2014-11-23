'use strict'

angular
  .module 'bowApp'
  .factory 'CurrentUser', [() ->
    _signIn = false

    init: (data) ->
      @id = data.id
      @username = data.username
      @nickname = data.nickname
      @email = data.email
      @state = data.state

    destroy: () ->
      @id = ''
      @username = ''
      @nickname = ''
      @email = ''
      @state = ''
  ]
