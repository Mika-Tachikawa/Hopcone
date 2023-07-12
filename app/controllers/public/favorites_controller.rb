class Public::FavoritesController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    @favorite = current_user.favorites.new(review_id: @review.id)
    @favorite.save
    redirect_to request.referer
  end

  def destroy
    @review = Review.find(params[:review_id])
    @favorite = current_user.favorites.find_by(review_id: @review.id)
    @favorite.destroy
    redirect_to request.referer
  end

  def index
    @favorites = Favorite.where(user_id: current_user.id).pluck(:review_id)
    @favorite_reviews = Review.find(@favorites)
  end


end
