define([
  'underscore',
  'backbone',
  // Pull in the Model module from above
  'models/topic/TopicModel'
], function(_, Backbone, TopicModel){
  var TopicsCollection = Backbone.Collection.extend({
    model: TopicModel
  });
  // You don't usually return a collection instantiated
  return TopicsCollection;
});