class Public::ReviewsController < ApplicationController

  def new
    @review = Review.new
    #@review.review_tags.build
  end

  def create
    #@review = Review.new(review_params)
    @review = Review.new(review_params)
    @reviews = Review.page(params[:page])
    @review.user_id = current_user.id
    tag_list = params[:review][:name].split(nil)
    if @review.save 
      @review.save_tag(tag_list)
      redirect_to review_path(@review)
    else
      redirect_to review_path(@review)
    end
  end

  def index
    @reviews = Review.page(params[:page])
    @tag_list = Tag.all
  end

  def show
    @review = Review.find(params[:id])
    @review_comment = ReviewComment.new
    @review_tags = @review.review_tags 
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
    #params.require(:review).permit(:name, :beer_image, :brewery, :location, :hoppy, :acidity, :sweetness, :evaluation, :comment, :star, { tag_ids: [] }).merge(user_id: current_user.id)
    params.require(:review).permit(:name, :beer_image, :brewery, :location, :hoppy, :acidity, :sweetness, :evaluation, :comment, :star)
  end

end
