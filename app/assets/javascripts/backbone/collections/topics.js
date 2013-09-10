define([
  'underscore',
  'backbone',
  'bootstrap',
  'models/topic/TopicModel'
], function(_, Backbone, Bootstrap, TopicModel){
  var TopicsCollection = Backbone.Collection.extend({
    model: TopicModel,
    url: '/topics'
  });
  return TopicsCollection;
});