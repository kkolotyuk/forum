define(
  [
    'jquery',
    'underscore',
    'backbone',
    'models/topics',
    'text!templates/topics.html',
    'views/topic',
    'views/messages',
    'models/topic',
    'text!templates/title\.html'
  ],
  ($, _, Backbone, TopicsCollection, topicsListTemplate, TopicView, MessageListView, TopicModel, titleTemplate) ->
    Backbone.View.extend(
      el: $("#topics")
      titleTemplate: _.template(titleTemplate, title: 'All Topics')
      template: _.template(topicsListTemplate)
      events:
        'click .create-topic': 'createTopic'
      model: TopicModel
      initialize: ->
        @messagesView = new MessageListView()
        @$el.html(@template)
        @collection = new TopicsCollection()
        @listenTo(@collection, 'add', @addOne);
        @collection.fetch()

      render: -> $('header').html(@titleTemplate)

      addOne: (topic) ->
        view = new TopicView({model: topic})
        view.parent = @
        @$el.find('tbody').append(view.render().el)

      createTopic: ->
        topic = new TopicModel()
        topic.save(
          { title: $("#new-topic-title").val() },
          { success: (topic) => @collection.add(topic) }
        )

    )
)
