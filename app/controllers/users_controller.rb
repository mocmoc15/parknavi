class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @parks = @user.parks
    @prefecture = @user.prefecture[:name]
    favorites = Favorite.where(user_id: current_user.id).pluck(:park_id)  # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    @favorite_list = Park.find(favorites)     # postsテーブルから、お気に入り登録済みのレコードを取得
  end

  def edit
  end

  def update
  if current_user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:prefecture_id)
  end

end

