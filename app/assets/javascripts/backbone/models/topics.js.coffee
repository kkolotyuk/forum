define(
  ['backbone', 'models/topic'],
  (Backbone, TopicModel) ->
    Backbone.Collection.extend(
      model: TopicModel
      url: '/topics'
    )
)
