class User::FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    post = Post.find(params[:post_id])
    #favoritesテーブルのpost_idカラムに上記のpostのidを入れる
    favorite = current_user.favorites.new(post_id: post.id)
    favorite.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
  end
end
