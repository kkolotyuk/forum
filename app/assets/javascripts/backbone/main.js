require.config({
  paths: {
    jquery: '../libs/jquery/jquery',
    underscore: '../libs/underscore/underscore',
    backbone: '../libs/backbone/backbone',
    templates: 'templates'
  }

});

require([

  // Load our app module and pass it to our definition function
  'app',
], function(App){
  // The "app" dependency is passed in as "App"
  App.initialize();
});