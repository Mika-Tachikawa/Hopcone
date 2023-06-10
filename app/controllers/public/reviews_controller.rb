class Public::ReviewsController < ApplicationController
  
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    @reviews = Review.page(params[:page])
    @review.user_id = current_user.id
    @review.save
    redirect_to admin_review_path(@reviews)
  end

  def index
    @reviews =Review.all
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end


  private

  def review_params
    params.require(:review).permit(:name, :beer_image, :brewery, :location, :hoppy, :acidity, :sweetness, :evaluation, :comment)
  end
  
end
