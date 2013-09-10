define([
  'underscore',
  'backbone'
], function(_, Backbone){
  var MessageModel = Backbone.Model.extend({
    urlRoot: '/messages'
  });
  return MessageModel;
});