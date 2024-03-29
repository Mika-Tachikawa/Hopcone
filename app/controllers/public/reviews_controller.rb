class Public::ReviewsController < ApplicationController

  before_action :authenticate_user!

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @reviews = Review.page(params[:page])
    @review.user_id = current_user.id
    tag_list = params[:review][:tag_name].split(',')
    if @review.save 
      @review.save_tags(tag_list)
      redirect_to review_path(@review), notice: "You have created review successfully."
    else
      render :new
    end
  end

  def index
    @review = Review.new
    @reviews = Review.page(params[:page])
    @reviews = Review.page(params[:page]).order(created_at: :desc)
    if params[:hoppy].to_i > 0
      @reviews = @reviews.where(hoppy: params[:hoppy])
    end
    if params[:acidity].to_i > 0
      @reviews = @reviews.where(acidity: params[:acidity])
    end
    if params[:sweetness].to_i > 0
      @reviews = @reviews.where(sweetness: params[:sweetness])
    end
  end
  
  def taste
    @review = Review.new
    @reviews = Review.page(params[:page])
    @reviews = Review.page(params[:page]).order(created_at: :desc)
    if params[:hoppy].to_i > 0
      @reviews = @reviews.where(hoppy: params[:hoppy])
    end
    if params[:acidity].to_i > 0
      @reviews = @reviews.where(acidity: params[:acidity])
    end
    if params[:sweetness].to_i > 0
      @reviews = @reviews.where(sweetness: params[:sweetness])
    end
  end

  def show
    @review = Review.find(params[:id])
    @reviews = Review.page(params[:page])
    @review_comment = ReviewComment.new
    @review_tags = @review.review_tags
    gon.hoppy = @review.hoppy
    gon.acidity = @review.acidity
    gon.sweetness = @review.sweetness
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    tag_list = params[:review][:tag_name].split(',')
    if @review.update(review_params)  
      @review.save_tags(tag_list)
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

  def ensure_correct_user
    @review = Review.find(params[:id])
    unless @review.user == current_user
      redirect_to reviews_path
    end
  end


end
