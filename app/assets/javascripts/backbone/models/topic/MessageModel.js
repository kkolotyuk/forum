define([
  'underscore',
  'backbone'
], function(_, Backbone){
  var MessageModel = Backbone.Model.extend({
    urlRoot: '/message',
    idAttribute: 'id'
  });
  return MessageModel;
});