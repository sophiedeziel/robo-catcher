App.robot = App.cable.subscriptions.create "RobotChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log("Connecté à la matrice")

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)
      
    for key,state of data
      if state == "pressed"
        $(".button-status ." + key).removeClass('inactive')
      else
        $(".button-status ." + key).addClass('inactive')
    
