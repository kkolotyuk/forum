define([
  'underscore',
  'backbone',
  'bootstrap',
  'models/topic/MessageModel'
], function(_, Backbone, Bootstrap, MessageModel){
  var MessagesCollection = Backbone.Collection.extend({
    model: MessageModel
  });
  return MessagesCollection;
});