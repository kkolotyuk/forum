define([
  'underscore',
  'backbone',
  'bootstrap'
], function(_, Backbone, Bootstrap){
  var TopicModel = Backbone.Model.extend({
    urlRoot: '/topics'
  });
  return TopicModel;
});