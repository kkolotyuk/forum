define([
  'underscore',
  'backbone',
  'bootstrap'
], function(_, Backbone, Bootstrap){
  var MessageModel = Backbone.Model.extend({
    urlRoot: '/messages'
  });
  return MessageModel;
});