define([
  'jquery',
  'underscore',
  'backbone',
  'text!templates/topics/messageTemplate.html',
], function($, _, Backbone, messageTemplate){
  var MessageView = Backbone.View.extend({
    tagName: 'li',
    events: {
      'click .remove-msg': 'removeMessage'
    },
     initialize: function(){
        //_.bindAll(this, 'render');
        //this.model.bind('change', this.render);
    },
    render: function(message){
        return _.template( messageTemplate, { message: message } );
    },
    removeMessage: function (e) {
        this.model.destroy();
    }
  });
  // Returning instantiated views can be quite useful for having "state"
  return MessageView;
});