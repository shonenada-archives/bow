angular.module 'bowApp'
  .factory 'Inbox', (Letter) ->

    _ids = []
    _letters = []
    _fetched = false

    add: (data) ->
      id = data.id
      if id of _letters
        msg = _letters[id]
      else
        msg = new Letter data
        _letters[id] = msg
      msg

    fetch: ->
      unless _fetched
        _fetched = true
        $http.get '/apis/accounts/letters'
        .success (resp) =>
          if resp.success
            angular.forEach resp.letters, @add

    all: ->
      fetch()
      [letter for letter in _letters]


