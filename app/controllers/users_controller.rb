class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @parks = @user.pars

    favorites = Favorite.where(user_id: current_user.id).pluck(:park_id)  # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    @favorite_list = Park.find(favorites)     # postsテーブルから、お気に入り登録済みのレコードを取得
  end

end

