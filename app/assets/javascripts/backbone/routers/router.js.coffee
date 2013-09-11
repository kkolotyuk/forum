define ["backbone", "views/topics", "views/messages", "models/topic"], (Backbone, TopicListView, MessageListView, TopicModel) ->
  AppRouter = Backbone.Router.extend(
    routes:
      "": "topics"
      "topic/:id": "topic"
      "*actions": "defaultAction"
  )
  initialize = ->
    app_router = new AppRouter
    app_router.on "route:topics", -> new TopicListView().render()
    app_router.on "route:defaultAction", (actions) -> console.log "No route:", actions
    app_router.on "route:topic", (id) ->
      topic = new TopicModel(id: id)
      topic.fetch(success: (topic) -> new MessageListView().render(topic))
    Backbone.history.start()

  initialize: initialize
