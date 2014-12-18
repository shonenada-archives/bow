angular.module 'bowApp'
  .factory 'Letter', (Account) ->

    class Letter
      constructor: (data) ->
        @id = data.id
        @fromId = data.from_id
        @toId = data.to_id
        @content = data.content
        @sendTime = data.created
        @initTarget()
        @initFromUser()

      initTarget: ->
        @target = Account.getById @toId

      initFromUser: ->
        @fromUser = Account.getById @fromId
