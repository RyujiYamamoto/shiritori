$(document).on 'turbolinks:load', ->
  # viewの<div id="messages">から受け取る
  messages = $('#messages') if $('#messages').length > 0

  App.room = App.cable.subscriptions.create { channel: "RoomChannel", room_id: messages.data('room_id') },
    received: (data) -> 
      $('#messages').append '<div>' + data['user_name'] + ': ' + data['message'] + '</div>'

    speak: (message) ->
      @perform 'speak', message: message

  $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
    if event.keyCode is 13
      App.room.speak event.target.value
      event.target.value = ''
      event.preventDefault()