define(
  [
    'jquery',
    'underscore',
    'backbone',
    'models/message',
    'models/messages',
    'views/message',
    'text!templates/title.html',
    'text!templates/messages.html'
  ],
  ($, _, Backbone, MessageModel, MessagesCollection, MessageView, titleTemplate, messagesListTemplate) ->
    Backbone.View.extend(
      el: $('#container')
      template: _.template(messagesListTemplate)
      events:
        'click .create-message': 'createMessage'

      initialize: ->
        @$el.html(@template)
        @input = @$el.find('#new-msg-text')
        @listenTo(@model.messages, 'add', @addOne)
        @model.messages.fetch()

      addOne: (message) ->
        view = new MessageView({model: message})
        @$el.find('ul').append(view.render().el)
        @input.val('')

      createMessage: ->
        @model.messages.create(content: @input.val())
    )
)
