class RoomsController < ApplicationController
  before_action :load_room, only: [:show]

  def show
    @furnitures = @room.furnitures
  end

  def search
    @rooms = Room.search_name_furnitures(params[:key])
                 .or(Room.search_rooms(params[:key])).distinct
                 .page(params[:page]).per(Settings.per_page_18)
    render "static_pages/home"
  end

  private

  def load_room
    @room = Room.includes(:images_blobs).find_by(id: params[:id])
    return if @room

    flash[:danger] = t "rooms.not_exist"
    redirect_to root_path
  end
end
