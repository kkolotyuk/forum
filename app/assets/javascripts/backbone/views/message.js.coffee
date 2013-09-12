define(
  ['jquery', 'underscore', 'backbone', 'text!templates/message.html', 'models/message'],
  ($, _, Backbone, messageTemplate, MessageModel) ->
    Backbone.View.extend(
      tagName: 'li'
      events:
        'click .remove-msg': 'removeMessage'
      model: MessageModel
      render: (message) -> $(@el).append(_.template( messageTemplate, message: message.toJSON()))
      removeMessage: (e) -> @model.destroy(success: (topic) => @el.remove())
    )
)