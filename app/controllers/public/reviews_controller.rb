class Public::ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @reviews = Review.page(params[:page])
    @review.user_id = current_user.id
    @review.save
    redirect_to review_path(@review)
  end

  def index
    @reviews = Review.all
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
    @review.destroy
    redirect_to reviews_path
  end


  private

  def review_params
    params.require(:review).permit(:name, :beer_image, :brewery, :location, :hoppy, :acidity, :sweetness, :evaluation, :comment)
  end

end
