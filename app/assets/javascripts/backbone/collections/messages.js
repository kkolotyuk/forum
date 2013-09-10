define([
  'underscore',
  'backbone',
  'models/topic/MessageModel'
], function(_, Backbone, MessageModel){
  var MessagesCollection = Backbone.Collection.extend({
    model: MessageModel
  });
  return MessagesCollection;
});