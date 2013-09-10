define([
  'underscore',
  'backbone',
  'models/topic/MessageModel'
], function(_, Backbone, MessageModel){
  var TopicModel = Backbone.Model.extend({
    urlRoot: '/topic',
    initialize: function() {

    }
    //idAttribute: '_id'
    // relations: [{
    //     type: Backbone.HasMany,
    //     key: 'messages',
    //     relatedModel: 'MessageModel',
    //     reverseRelation: {
    //         key: 'topic',
    //         includeInJSON: '_id',
    //     },
    // }]
  });
  // Return the model for the module
  return TopicModel;
});