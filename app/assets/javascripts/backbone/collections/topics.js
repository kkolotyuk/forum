define([
  'underscore',
  'backbone',
  'models/topic/TopicModel'
], function(_, Backbone, TopicModel){
  var TopicsCollection = Backbone.Collection.extend({
    model: TopicModel,
    url: '/topics'
  });
  return TopicsCollection;
});