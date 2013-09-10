// Filename: router.js
define([
  'jquery',
  'underscore',
  'backbone',
  'views/topics/TopicListView',
  'views/topics/TopicView',
  'views/topics/MessageListView',
  'models/topic/TopicModel'
], function($, _, Backbone, TopicListView, TopicView, MessageListView, TopicModel){
  var AppRouter = Backbone.Router.extend({
    routes: {
      // Define some URL routes
      '': 'topics',
      "topic/:id": "getTopic",

      // Default
      '*actions': 'defaultAction'
    }
  });

  var initialize = function(){
    var app_router = new AppRouter;
    app_router.on('route:topics', function(){
      var topicsView = new TopicListView();
      topicsView.render();
    });
    app_router.on('route:defaultAction', function(actions){
      // We have no matching route, lets just log what the URL was
      console.log('No route:', actions);
    });
    app_router.on('route:getTopic', function (id) {
       var topic = new TopicModel({id: id});

       topic.fetch({
          success: function (topic) {
              var messagesView = new MessageListView();
              messagesView.render(topic);
          }
       })
    });
    Backbone.history.start();
  };
  return {
    initialize: initialize
  };
});