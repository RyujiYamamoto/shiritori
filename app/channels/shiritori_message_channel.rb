class ShiritoriMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "shiritori_message_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    ActionCable.server.broadcast 'shiritori_message_channel', message: data['message']
  end
end
