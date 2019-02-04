class ShiritoriMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "shiritori_message_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    @message = ShiritoriMessage.new user_id: current_user.id, body: data['message']
    puts(data['message'])
    puts(@message.user_id)
    puts(@message.body)
    @message.save!
  end
end
