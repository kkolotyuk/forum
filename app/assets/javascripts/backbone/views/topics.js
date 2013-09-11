define([
    'jquery',
    'underscore',
    'backbone',
    'models/topics',
    'text!templates/topics.html',
    'text!templates/topic.html',
    'views/topic',
    'models/topic',
    'text!templates/title\.html'
], function($, _, Backbone, TopicsCollection, topicsListTemplate, topicTemplate, TopicView, TopicModel, titleTemplate){
    var TopicListView = Backbone.View.extend({
        el: $("#container"),
        events: {
            'click .create-topic': 'createTopic'
        },
        model: TopicModel,
        render: function(){
            this.$el.html(_.template( topicsListTemplate));
            this.collection = new TopicsCollection();
            var _this = this;
            var topics = this.collection.fetch({
                success: function(topics) {
                    var models = topics.models;
                    for (topic_key in models) {
                        _this.renderItem(models[topic_key]);
                    }
                    $('header').html(_.template( titleTemplate, { title: "All Topics" } ));
                }
            });

        },
        initialize: function(){
            //_.bindAll(this, "renderItem");
        },
        renderItem: function (topic) {
            var topicView = new TopicView({model: topic});
            topicView.render(topic);
            this.$el.find('ul').append(topicView.el);
        },

        createTopic: function () {
            var title = $("#new-topic-title").val();
            var _this = this;
            var topic = new TopicModel();
            topic.save({title: title}, {
                success: function(topic) {
                    _this.renderItem(topic);
                }
            })
        }

    });
    return TopicListView;
});