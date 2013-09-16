define(
  ['jquery', 'underscore', 'backbone', 'text!templates/message.html', 'models/message'],
  ($, _, Backbone, messageTemplate, MessageModel) ->
    Backbone.View.extend(
      tagName: 'tr'
      template: _.template( messageTemplate)
      events:
        'click .remove-msg': 'clear'
        'dblclick .view': 'edit'
        'keypress .edit': 'updateOnEnter'
      model: MessageModel

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
        @model.save({content: @input.val()})
        @$el.removeClass("editing")

      updateOnEnter: (e) -> @update() if e.keyCode == 13
    )
)