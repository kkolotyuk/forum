define(
  [
    'jquery',
    'underscore',
    'backbone',
    'models/topics',
    'text!templates/topics.html',
    'views/topic',
    'models/topic',
    'text!templates/title\.html'
  ],
  ($, _, Backbone, TopicsCollection, topicsListTemplate, TopicView, TopicModel, titleTemplate) ->
    Backbone.View.extend(
      el: $("#container")
      events:
        'click .create-topic': 'createTopic'
      model: TopicModel
      render: ->
        @$el.html(_.template(topicsListTemplate))
        @collection = new TopicsCollection()
        topics = @collection.fetch(
          success: (topics) =>
            models = topics.models;
            for model in models
              @renderItem(model)
            $('header').html(_.template(titleTemplate, title: 'All Topics'))
        )
      renderItem: (topic) ->
        topicView = new TopicView(model: topic)
        topicView.render(topic)
        @$el.find('ul').append(topicView.el)
      createTopic: ->
        topic = new TopicModel()
        topic.save(
          title: $("#new-topic-title").val()
          success: (topic) =>
            @renderItem(topic)
        )

    )
)