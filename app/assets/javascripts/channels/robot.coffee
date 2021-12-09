App.robot = App.cable.subscriptions.create "RobotChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log("Connecté à la matrice")

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)
    # Called when there's incoming data on the websocket for this channel
