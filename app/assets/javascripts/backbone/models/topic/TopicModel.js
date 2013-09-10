define([
  'underscore',
  'backbone',
  'models/topic/MessageModel'
], function(_, Backbone, MessageModel){
  var TopicModel = Backbone.Model.extend({
    urlRoot: '/topics',
    initialize: function() {

    }
  });
  return TopicModel;
});