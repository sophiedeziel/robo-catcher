App.robot = App.cable.subscriptions.create "AttemptChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log("écoute les tentatives")

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)
    if data.is_shiny
      $('#shinyIMG').attr('src', data.image)
      $('#shinyModal .false-positive').attr('href', '/shinies/' + data.id + '/false_positive')
      $('#shinyModal .confirm').attr('href', '/shinies/' + data.id + '/confirm')
      $('#shinyModal').modal('show')