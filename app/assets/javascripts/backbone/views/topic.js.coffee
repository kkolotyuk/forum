define(
  ['jquery', 'underscore', 'backbone', 'text!templates/topic.html', 'models/topic'],
  ($, _, Backbone, topicTemplate, TopicModel) ->
    Backbone.View.extend(
      tagName: 'li'
      events:
        'click .remove-topic': 'removeTopic'
      model: TopicModel
      render: (topic) ->
        @$el.append(_.template(topicTemplate, topic: topic.toJSON()))
      removeTopic: (e) ->
        @model.destroy(success: (topic) => @el.remove())
    )
)