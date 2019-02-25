class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:like_id])
    current_user.like(micropost)
    flash[:success] = 'お気に入りリストに追加しました。'
    redirect_to root_url
  end

  def destroy
    micropost = Micropost.find(params[:like_id])
    current_user.unlike(micropost)
    flash[:success] = 'お気に入りリストから削除しました。'
    redirect_to root_url
  end
  
  def likes
    @micropost = Micropost.find(params[:like_id])
    @liked_microposts = @micropost.likes.page(params[:page])
  end
end
