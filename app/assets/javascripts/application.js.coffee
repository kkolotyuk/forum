# Load our app module and pass it to our definition function
require ["app"], (App) ->

  # The "app" dependency is passed in as "App"
  App.initialize()
