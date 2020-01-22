class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  def create
    # micropostにmicropost_idを入れる
    micropost = Micropost.find(params[:micropost_id])
    # ログインしているユーザがmicropostをお気に入り登録する
    current_user.favorite(micropost)
    flash[:success] = 'お気に入り登録をしました。'
    redirect_to root_path
  end

  def destroy
    # micropostにmicropost_idを入れる
    micropost = Micropost.find(params[:micropost_id])
    # ログインしているユーザがmicropostのお気に入り登録を解除する
    current_user.unfavorite(micropost)
    flash[:success] = 'お気に入り登録を解除しました。'
    redirect_to root_path
  end
end
