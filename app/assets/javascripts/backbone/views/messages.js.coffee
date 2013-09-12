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
      events:
        'click .create-message': 'createMessage'
      render: (topic) ->
        @$el.html(_.template(messagesListTemplate))
        topicJSON = topic.toJSON()
        @collection = new MessagesCollection(topicJSON.messages)
        models = @collection.models
        for model in models
          @renderItem(model)
        $('header').html(_.template( titleTemplate, { title: 'Topic ' + topicJSON.title } ))
      renderItem: (msg) ->
        msgView = new MessageView(model: msg)
        msgView.render(msg)
        @$el.find('ul').append(msgView.el)

      createMessage: ->
        text = $('#new-message-text').val()
        message = new MessageModel(content: text)
        message.save(
          { content: text },
          { success: (msg) => @renderItem(msg) }
        )
    )
)
