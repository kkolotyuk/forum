define([
    'underscore',
    'backbone',
    'models/message'
], function(_, Backbone, MessageModel){
    var MessagesCollection = Backbone.Collection.extend({
        model: MessageModel
    });
    return MessagesCollection;
});