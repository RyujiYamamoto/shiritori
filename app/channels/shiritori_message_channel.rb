class ShiritoriMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "shiritori_message_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    ShiritoriMessage.create! user_id: current_user.id, body: data['message']
  end
end
