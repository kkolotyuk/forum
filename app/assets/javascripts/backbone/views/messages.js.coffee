define(
  [
    'jquery',
    'underscore',
    'backbone',
    'models/message',
    'models/messages',
    'views/message',
    'views/messages',
    'text!templates/title.html',
    'text!templates/messages.html'
  ],
  ($, _, Backbone, MessageModel, MessagesCollection, MessageView, MessageListView, titleTemplate, messagesListTemplate) ->
    Backbone.View.extend(
      el: $("#messages")
      template: _.template(messagesListTemplate)
      events:
        'click .create-message': 'createMessage'

      setTopic: (topic) ->
        @stopListening()
        @model = topic
        @listenTo(@model.messages, 'add', @addOne)
        @listenTo(@model.messages, 'reset', @addAll)
        @listenTo(@model, 'destroy', @remove)

      addOne: (message) ->
        view = new MessageView({model: message})
        @$el.find('tbody').append(view.render().el)
        @input.val('')

      addAll: ->
        @$el.find('tbody').empty()
        @model.messages.each(@addOne, @)

      render: ->
        @$el.html(@template)
        @input = @$el.find('#new-message-content')
        @model.messages.fetch(reset: true)
        @

      createMessage: -> @model.messages.create(content: @input.val())

      clear: -> @el.empty()
    )
)
