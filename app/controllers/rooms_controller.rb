class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @messages = @room.shiritori_messages
  end
end
