class Admin::ReviewsController < ApplicationController
  
  def index
    @reviews = Review.page(params[:page])
    @reviews = Review.page(params[:page]).order(created_at: :desc)
  end
  
  def show
    @review = Review.find(params[:id])
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to admin_reviews_path, notice: 'You have deleted review successfully.'
    else
      render :show
    end
  end
  
  
  private

  def review_params
    params.require(:review).permit(:name, :beer_image, :brewery, :location, :hoppy, :acidity, :sweetness, :evaluation, :comment, :star)
  end
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :email, :introduction)
  end
  
  
end
