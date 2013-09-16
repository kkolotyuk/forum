define(
  ['jquery', 'underscore', 'backbone', 'text!templates/topic.html', 'views/messages'],
  ($, _, Backbone, topicTemplate, MessageListView) ->
    Backbone.View.extend(
      tagName: 'tr'
      template: _.template(topicTemplate)
      events:
        'click .remove-topic': 'clear'
        'click .edit-topic': 'edit'
        'click .view': 'showMessages'
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

      update: ->
        @model.save({title: @input.val()})
        @$el.removeClass("editing")

      updateOnEnter: (e) -> @update() if e.keyCode == 13

      showMessages: ->
        view = new MessageListView(model: @model)
        view.render()

    )
)