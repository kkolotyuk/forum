define(
  ['backbone', 'models/messages'],
  (Backbone, MessagesCollection) ->
    Backbone.Model.extend(
      urlRoot: '/topics'
      initialize: ->
        @messages = new MessagesCollection
        @messages.url = "/topics/#{@id}/messages"
    )
)
