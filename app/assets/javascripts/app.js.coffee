define(
  ["jquery", "underscore", "backbone", "router", 'views/topics'],
  ($, _, Backbone, Router, TopicListView) ->
    initialize = ->
      new TopicListView().render()
      # Pass in our Router module and call it's initialize function
      # Router.initialize()

    initialize: initialize
)