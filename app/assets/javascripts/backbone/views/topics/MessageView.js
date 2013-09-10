define([
  'jquery',
  'underscore',
  'backbone',
  'bootstrap',
  'text!templates/topics/messageTemplate.html',
  'models/topic/MessageModel'
], function($, _, Backbone, Bootstrap, messageTemplate, MessageModel){
  var MessageView = Backbone.View.extend({
    tagName: 'li',
    events: {
      'click .remove-msg': 'removeMessage'
    },
    model: MessageModel,
    render: function(message){
        $(this.el).append(_.template( messageTemplate, { message: message.toJSON() } ));
    },
    removeMessage: function (e) {
        var _this = this;
        this.model.destroy({
          success: function (topic) {
              _this.el.remove();
          }}
        );
    }
  });
  return MessageView;
});