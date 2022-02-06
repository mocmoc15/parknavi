class ParksController < ApplicationController

  def index
    @parks = Park.all.order("created_at DESC")
  end

  def new
    @park = Park.new
  end

  def create
    @park = Park.create(park_params)
    if @park.save
      redirect_to root_path
    else
      render :new
    end
  end


  def show
    @park = Park.find(params[:id])
    @comment = Comment.new
    @comments = @park.comments.includes(:user)
  end


  def edit
    @park = Park.find(params[:id])
  end

  def update
    @park = Park.find(params[:id])
    if @park.update(park_params)
      redirect_to park_path
    else
      render :edit
    end
  end


  def search
    @q = Park.ransack(params[:q])
    @parks = @q.result
  end

  def map
  end


  private
  def park_params
    params.require(:park).permit(:name, :prefecture_id, :address, :opening_hours, :parking, :vending_machine, :hand_wash, :toilet, :breastfeeding_room, :diaper_changing_table, :play_set, :sandbox, :grass, :kick_bike, :store, :restaurant).merge(user_id: current_user.id)
  end


end


