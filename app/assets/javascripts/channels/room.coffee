$(document).on 'turbolinks:load', ->
  # viewの<div id="messages">から受け取る
  messages = $('#messages') if $('#messages').length > 0

  App.room = App.cable.subscriptions.create { channel: "RoomChannel", room_id: messages.data('room_id') },
    received: (data) -> 
      $('#messages').append data['message']

    speak: (message) ->
      @perform 'speak', message: message
      
  

  $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
    if event.keyCode is 13
      #if !is_shiritori(event.target.value)
      #  alert "しりとりになってません……"
      #else
      App.room.speak event.target.value
      event.target.value = ''
      event.preventDefault()
        
#is_shiritori: (message) -> 
#    target = $('.message').last().find('p').slice(-1)
#    message[0] == target