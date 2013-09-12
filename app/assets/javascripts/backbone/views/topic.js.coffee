define(
  ['jquery', 'underscore', 'backbone', 'text!templates/topic.html'],
  ($, _, Backbone, topicTemplate) ->
    Backbone.View.extend(
      tagName: 'li'
      template: _.template(topicTemplate)
      events:
        'click .remove-topic': 'clear'
        'dblclick .view': 'edit'
        'keypress .edit': 'updateOnEnter'

      initialize: ->
        @listenTo(@model, 'change', @render)
        @listenTo(@model, 'destroy', @remove)

      render: ->
        @$el.html(@template(@model.toJSON()))
        @input = @$('.edit');
        @

      clear: -> @model.destroy()

      edit: ->
        @$el.addClass("editing")
        @input.focus()

      updateOnEnter: (e) ->
        @close() if e.keyCode == 13

      close: ->
        @model.save({title: @input.val()})
        @$el.removeClass("editing")
    )
)