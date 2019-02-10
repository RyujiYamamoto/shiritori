class ShiritoriMessagesController < ApplicationController
  def index
    unless logged_in?
      session[:callback] = shiritori_messages_index_path
      return redirect_to login_path
    end
    @shiritori_messages = ShiritoriMessage.all
  end
  
end









