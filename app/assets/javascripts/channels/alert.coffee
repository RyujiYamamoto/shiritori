$(document).on 'turbolinks:load', ->
  #すべてのチャンネルの購読を解除する
  removeAllChannel = ->
    console.log('removeAllChannel')
    subscriptions = App.cable.subscriptions['subscriptions']
    for subscription, index in subscriptions
        App.cable.subscriptions.remove(subscription)

  # viewの<div id="current_user">から受け取る
  if $('#current_user').length > 0
    current_user = $('#current_user')

    App.alert = App.cable.subscriptions.create { channel: "AlertChannel", user_id: current_user.data('user_id')},
      received: (data) ->
        alert data['message']
  else
    removeAllChannel()
