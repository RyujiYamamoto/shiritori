$(document).on 'turbolinks:load', ->
  # viewの<div id="current_user">から受け取る
  current_user = $('#current_user') if $('#current_user').length > 0

  App.alert = App.cable.subscriptions.create { channel: "AlertChannel", user_id: current_user.data('user_id')},
    received: (data) -> 
      alert data['message']

