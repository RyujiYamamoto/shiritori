class ShiritoriMessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(shiritori_message)
    ActionCable.server.broadcast "room_channel_#{shiritori_message.room_id}",
      message: render_message(shiritori_message)
  end
  
  def render_message(message)
    ApplicationController.renderer.render(partial: "rooms/message", 
                                          locals: { message: message })
  end
      
end
