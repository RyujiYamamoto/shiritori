$(document).on 'turbolinks:load', ->
  
  #すべてのチャンネルの購読を解除する
  removeAllChannel = ->
    console.log('removeAllChannel')
    subscriptions = App.cable.subscriptions['subscriptions']
    for subscription, index in subscriptions
        App.cable.subscriptions.remove(subscription)
  
  # viewの<div id="messages">から受け取る
  if $('#messages').length > 0
    messages = $('#messages') 

    App.room = App.cable.subscriptions.create { channel: "RoomChannel", room_id: messages.data('room_id') },
      received: (data) -> 
        $('#messages').append data['message']
  
      speak: (message) ->
        @perform 'speak', message: message
  else
    removeAllChannel()

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()
  
  