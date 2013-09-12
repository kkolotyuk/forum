define(
  ['jquery', 'underscore', 'backbone', 'text!templates/topic.html'],
  ($, _, Backbone, topicTemplate) ->
    Backbone.View.extend(
      tagName: 'li'
      template: _.template(topicTemplate)
      events:
        'click .remove-topic': 'clear'

      initialize: ->
        @listenTo(@model, 'change', @render)
        @listenTo(@model, 'destroy', @remove)

      render: ->
        @$el.html(@template(@model.toJSON()))
        @

      clear: -> @model.destroy()
    )
)