define([
    'underscore',
    'backbone'
], function(_, Backbone){
    var TopicModel = Backbone.Model.extend({
        urlRoot: '/topics'
    });
    return TopicModel;
});