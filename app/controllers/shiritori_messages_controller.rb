class ShiritoriMessagesController < ApplicationController
  def index
    @shiritori_messages = ShiritoriMessage.all
  end
end
