define([
    'jquery',
    'underscore',
    'backbone',
    'models/message',
    'models/messages',
    'views/message',
    'text!templates/title.html',
    'text!templates/messages.html'
], function($, _, Backbone, MessageModel, MessagesCollection, MessageView, titleTemplate, messagesListTemplate){
    var MessageListView = Backbone.View.extend({
        el: $("#container"),
        events: {
            'click .create-message': 'createMessage'
        },
        initialize: function(){
            //_.bindAll(this, "renderItem");
        },
        render: function(topic){
            this.$el.html(_.template( messagesListTemplate));
            var messages = topic.toJSON().messages;
            this.collection = new MessagesCollection(messages);
            var models = this.collection.models;
            for (key in models) {
                this.renderItem(models[key]);
            }

            $('header').html(_.template( titleTemplate, { title: 'Topic ' + topic.toJSON().title } ));
        },

        renderItem: function (msg) {
            var msgView = new MessageView({model: msg});
            msgView.render(msg);
            this.$el.find('ul').append(msgView.el);
        },

        createMessage: function () {
            var _this = this;
            var text = $('#new-message-text').val();
            var message = new MessageModel();
            message.save({content: text}, {
                success: function(msg) {
                    _this.renderItem(msg);
                }
            });
        }

    });
    return MessageListView;
});