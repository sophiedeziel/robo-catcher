App.starter = App.cable.subscriptions.create "StarterChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log("Écoute les stats")

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)
    $('.starter-counts .total .number').text(data.total_tries)
    $('.starter-counts .chimcar_total .number').text(data.chimchar_total)
    $('.starter-counts .turtwig_total .number').text(data.turtwig_total)
    $('.starter-counts .piplup_total .number').text(data.piplup_total)
    $('.starter-counts .current .number').text(data.run_tries)
