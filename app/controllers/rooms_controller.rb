class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  
  def show
    let_log_in_unless_logged_in(room_path(params[:id]))
    @room = Room.find(params[:id])
    if (@room.guest_user_id.nil? && @room.host_user_id != current_user.id)
      @room.update!(guest_user_id: current_user.id)
    elsif (!@room.guest_user_id.nil? && !(@room.guest_user_id == current_user.id || @room.host_user_id == current_user.id))
      respond_to do |format|
        format.html { redirect_to rooms_path, notice: 'この部屋には、すでにしりとりゲストが入室済みです。' }
        format.json { render :index, status: :ok, location: rooms_path }
      end
    end
    @messages = @room.shiritori_messages
  end
  
  def index
    let_log_in_unless_logged_in(rooms_path)
    @rooms = Room.all
  end

  def new
    let_log_in_unless_logged_in(new_room_path)
    @room = Room.new
  end

  def edit
    let_log_in_unless_logged_in(edit_room_path(params[:id]))
  end

  def create
    @room = Room.new(room_params)
    @room.host_user_id = current_user.id

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name)
    end
end
