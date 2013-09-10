define([
  'jquery',
  'underscore',
  'backbone',
  'models/topic/MessageModel',
  'collections/messages',
  'views/topics/MessageView'
], function($, _, Backbone, MessageModel, MessagesCollection, MessageView){
  var MessageListView = Backbone.View.extend({
    el: $("#container"),
    events: {
      'click .create-message': 'createMessage'
    },
    initialize: function(){
        _.bindAll(this, "renderItem");
    },
    render: function(topic){
      //TODO:: get messages by id


      this.collection = new MessagesCollection();
      this.collection.add({ text: "msg 1"});
      this.collection.add({ text: "msg 2"});
      var models = this.collection.models;

      for (key in models) {
        this.addOne(models[key]);
      }
      $('h1').html('Topic ' + topicTitle)
    },
    render_message: function(message) {
        var message_view = new $.forum.MessageView({model: message});
        this.$('div.message_list').append($(message_view.render()));
    },

    addOne: function (msg) {
      var msgView = new MessageView();
      this.$el.find('ul').append(msgView.render(msg));
    },

    createMessage: function () {
      var new_message = new MessageModel({text: $('#new-message-text').val()});
      new_message.save();
    }

  });
  // Returning instantiated views can be quite useful for having "state"
  return MessageListView;
});