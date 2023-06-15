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
    @reviews = Review.page(params[:page])
  end

  def show
    @review = Review.find(params[:id])
    @review_comment = ReviewComment.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)  # データ（レコード）を編集
      redirect_to review_path(@review), notice: 'You have updated review successfully.'
    else
      render :edit
    end  
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
     redirect_to reviews_path, notice: 'You have deleted review successfully.'
    else
      render :edit
    end
  end


  private

  def review_params
    params.require(:review).permit(:name, :beer_image, :brewery, :location, :hoppy, :acidity, :sweetness, :evaluation, :comment, :star)
  end

end
