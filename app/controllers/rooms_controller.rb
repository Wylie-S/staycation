class RoomsController < ApplicationController
before_action :set_room, except:[:index, :new , :create]
  before_action :authenticate_user!, except: [:show]
before_action :is_authorized, only: [:listing, :pricing, :description, :photo_upload, :amenities, :location, :update]

  def index
@rooms = current_user.rooms
  end

  def new
@room = current_user.rooms.build
  end

 def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to listing_room_path(@room), notice: "Saved..."
    else
      flash[:alert] = "Something is wrong..."
      render :new
    end
  end
def show
end

  def listing

  end

  def pricing
set_room
  end


  def description
set_room
  end

#one room can have many photos
  def photo_upload
@photos = @room.photos
  end

  def amenities
  end

  def location
  end
def update

    if @room.update(room_params)
      flash[:notice] = "Saved..."
    else
      flash[:alert] = "Something is wrong..."
    end
    redirect_back(fallback_location: request.referer)
  end

private

  def set_room
@room = Room.find(params[:id])
end

def is_authorized
redirect_to root_path, alert: "You cannot do that " unless current_user.id == @room.user_id
 def room_params
      params.require(:room).permit(:home_type, :room_type, :accomodate, :bed_room, :bath_room, :listing_name, :summary, :address, :is_tv, :is_kitchen, :is_air, :is_heating, :is_internet, :price, :active)
    end
end
end 
