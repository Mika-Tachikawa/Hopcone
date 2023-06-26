class Public::HomesController < ApplicationController
  
  def top
    @reviews = Review.all
    @reviews = Review.all.order(created_at: :desc)
    @reviews_latest5 = @reviews.first(5)
  end


  private

  def review_params
    params.require(:review).permit(:name, :beer_image, :brewery)
  end
  
  
end
