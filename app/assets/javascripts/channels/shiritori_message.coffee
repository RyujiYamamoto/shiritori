App.shiritori_message = App.cable.subscriptions.create "ShiritoriMessageChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#shiritori_messages').append '<div>' + data['user_name'] + ':' + data['message'] + '</div>'

  speak:(message) ->
    @perform 'speak', message: message

$(document).on 'keypress', '[data-behavior~=speak_shiritori_messages]', (event) ->
  if event.keyCode is 13
    App.shiritori_message.speak event.target.value
    event.target.value = ''
    event.preventDefault()
      
  