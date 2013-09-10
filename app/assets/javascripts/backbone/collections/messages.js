define([
  'underscore',
  'backbone',
  // Pull in the Model module from above
  'models/topic/MessageModel'
], function(_, Backbone, MessageModel){
  var MessagesCollection = Backbone.Collection.extend({
    model: MessageModel
  });
  // You don't usually return a collection instantiated
  return MessagesCollection;
});