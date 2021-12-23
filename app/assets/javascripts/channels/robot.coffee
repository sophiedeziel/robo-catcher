App.robot = App.cable.subscriptions.create "RobotChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log("Connecté à la matrice")

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)

    if data.instructionStart
      #$(".instructions-list .instruction").removeClass('active')
      $("#" + data.instructionStart).addClass('active')

    if data.instructionFinish
      $("#" + data.instructionFinish).removeClass('active')
      
    for key,state of data
      if state == "pressed"
        $(".button-status ." + key).removeClass('inactive')
      else
        $(".button-status ." + key).addClass('inactive')

    if data.status == "stopping" || data.status == "off"
      $(".instructions-list .instruction").removeClass('active')
    
