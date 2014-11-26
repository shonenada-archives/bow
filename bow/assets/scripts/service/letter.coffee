angular.module 'bowApp'
  .factory 'Letter', ->

    class Letter
      constructor: (data) ->
        @id = data.id
        @fromId = data.from_id
        @toId = data.to_id
        @content = data.content
        @sendTime = data.created

    Letter
