angular.module 'bowApp'
  .factory 'CurrentUser', ($http, $q) ->
    _signIned = false

    init: (data) ->
      @id = data.id
      @username = data.username
      @nickname = data.nickname
      @email = data.email
      @state = data.state

    destroy: ->
      @id = ''
      @username = ''
      @nickname = ''
      @email = ''
      @state = ''

    get: ->
      deferred = $q.defer()
      unless @_signIned
        $http.get '/apis/account'
        .success (resp) =>
          if resp
            @signIn(resp)
            deferred.resolve()
          else
            @signOut()
            deferred.reject()
      else
        deferred.resolve()
      deferred.promise

    setSignIned: ->
      @_signIned = true

    setSignOuted: ->
      @_signIned = false

    signIn: (data) ->
      @init(data)
      @setSignIned()

    signOut: ->
      @destroy()
      @setSignOuted()
