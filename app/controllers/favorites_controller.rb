class FavoritesController < ApplicationController
  before_action :authenticate_user!

  # お気に入り登録
  def create
    @favorite = current_user.favorites.create(park_id: params[:park_id])
    redirect_back(fallback_location: root_path)
  end

  # お気に入り削除
  def destroy
    @park = Park.find(params[:park_id])
    @favorite = current_user.favorites.find_by(park_id: @park.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end




end
