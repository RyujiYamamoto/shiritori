class ShiritoriMessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(shiritori_message)
    ActionCable.server.broadcast 'shiritori_message_channel', 
      user_name: shiritori_message.user_name, 
      message: shiritori_message.body
  end
end
