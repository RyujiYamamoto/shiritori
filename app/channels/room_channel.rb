class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params['room_id']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

=begin
  受け取ったメッセージを保存する。
  ただし、以下の場合はメッセージを保存しない。
    ①しりとりになってない場合
    ②同じユーザが続けて発言した場合
=end
  def speak(data)
    @message = ShiritoriMessage.new(user_id: current_user.id, body: data['message'],
                                      room:Room.find(params['room_id']))
    @last_message = Room.find(params['room_id']).shiritori_messages.last
    if (@last_message.nil? || 
      (@last_message.body[-1].eql?(@message.body[0]) && @last_message.user_id != current_user.id) )
      @message.save!
    else
      ActionCable.server.broadcast "alert_channel_#{current_user.id}", message: 'しりとりになってないよ！' 
    end
  end
end