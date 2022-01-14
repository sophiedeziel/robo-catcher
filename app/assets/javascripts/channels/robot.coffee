App.robot = App.cable.subscriptions.create "RobotChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log("Connecté à la matrice")

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)

    if data.status
      $(".robot-status")
        .removeClass("on off stopping")
        .addClass(data.status)

      if data.current_pokemon
        $(".robot-status-link img").attr('src', data.current_pokemon.image)
        $(".robot-status-link").attr('href', "/sequences/" + data.current_sequence.id)
      else
        $(".robot-status-link img").attr('src', null)
        $(".robot-status-link").attr('href', null)


    if data.instructionStart
      $("#" + data.instructionStart).addClass('current_instruction')

    if data.instructionFinish
      $("#" + data.instructionFinish).removeClass('current_instruction')
      
    for key,state of data
      if state == "pressed"
        $(".button-status ." + key).removeClass('inactive')
      else
        $(".button-status ." + key).addClass('inactive')

    if data.status == "stopping" || data.status == "off"
      $(".instructions-list .instruction").removeClass('current_instruction')
    
