define([
  'underscore',
  'backbone'
], function(_, Backbone){
  var MessageModel = Backbone.Model.extend({
    urlRoot: '/message',
    idAttribute: '_id'
  });
  // Return the model for the module
  return MessageModel;
});