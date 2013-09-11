define(
  ['backbone'],
  (Backbone) ->
    MessageModel = Backbone.Model.extend urlRoot: '/messages'
)
