class RoomsController < ApplicationController
  before_action :load_room, only: [:show]

  def show
    @furnitures = @room.furnitures
  end

  private

  def load_room
    @room = Room.includes(:images_blobs).find_by(id: params[:id])
    return if @room

    flash[:danger] = t "rooms.not_exist"
    redirect_to root_path
  end
end
