define(
  ['jquery', 'underscore', 'backbone', 'text!templates/topic.html'],
  ($, _, Backbone, topicTemplate) ->
    Backbone.View.extend(
      tagName: 'tr'
      template: _.template(topicTemplate)
      events:
        'click .remove-topic': 'clear'
        'click .edit-topic': 'edit'
        'click td:first-child': 'showMessages'
        'keypress .edit': 'updateOnEnter'
        'blur .edit': 'update'

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
        $('#topics tr').removeClass('info')
        @$el.addClass("info")
        @parent.messagesView.setTopic(@model)
        @parent.messagesView.render()

    )
)