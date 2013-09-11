define([
    'jquery',
    'underscore',
    'backbone',
    'text!templates/topic.html',
    'models/topic'
], function($, _, Backbone, topicTemplate, TopicModel){
    var TopicView = Backbone.View.extend({
        tagName: 'li',
        events: {
            'click .remove-topic': 'removeTopic'
        },
        model: TopicModel,
        render: function(topic){
            $(this.el).append(_.template( topicTemplate, { topic: topic.toJSON() } ));
        },
        removeTopic: function (e) {
            var _this = this;
            this.model.destroy({
                    success: function (topic) {
                        _this.el.remove();
                    }}
            );
        }
    });
    return TopicView;
});