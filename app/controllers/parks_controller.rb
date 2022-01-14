class ParksController < ApplicationController

  def index
    @parks = Park.all
  end

  def new
    @park = Park.new
  end

  def create
    Park.create(park_params)
  end

  private
  def park_params
    params.require(:park).permit(:name, :prefecture_id)
  end



end
