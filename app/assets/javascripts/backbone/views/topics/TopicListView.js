define([
  'jquery',
  'underscore',
  'backbone',
  // Pull in the Collection module from above
  'collections/topics',
  'text!templates/topics/topicsListTemplate.html',
  'text!templates/topics/topicTemplate.html',
  'views/topics/TopicView',
  'models/topic/TopicModel',
  'text!templates/topics/titleTemplate.html'
], function($, _, Backbone, TopicsCollection, topicsListTemplate, topicTemplate, TopicView, TopicModel, titleTemplate){
  var TopicListView = Backbone.View.extend({
    el: $("#container"),
    events: {
      'click .create-topic': 'createTopic'
    },
    model: TopicModel,
    render: function(){
      $("#container").html(_.template( topicsListTemplate));
      this.collection = new TopicsCollection();
      var t = new TopicModel({"id": 1, "title": "gg", "messages": []});
      this.collection.add(t);
      var models = this.collection.models;
      for (topic_key in models) {
        this.renderItem(models[topic_key]);
      }
      $('header').html(_.template( titleTemplate, { title: "All Topics" } ))
    },
     initialize: function(){
      _.bindAll(this, "renderItem");
    },
    renderItem: function (topic) {
      topicModel = new TopicModel();
      topicModel.save({title: topic.get('title')}, {
          success: function (topic) {
              alert(topic.toJSON());
          }
      })
      var topicView = new TopicView({model: topicModel});
      topicView.render(topic);
      this.$el.find('ul').append(topicView.el);
    },

    createTopic: function () {
      var title = $("#new-topic-title").val();
      this.collection = new TopicsCollection();
      var topic = new TopicModel({title: title});
      this.collection.add(topic);
      this.renderItem(topic);
    }

  });
  return TopicListView;
});