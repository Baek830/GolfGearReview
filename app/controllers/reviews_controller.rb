class ReviewsController < ApplicationController
  before_action :find_gear
  before_action :find_review, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def new
    @review = Review.new
  end
  def create
    @review = Review.new(review_params)
    @review.gear_id = @gear.id
    @review.user_id = current_user.id
    if @review.save
      redirect_to gear_path(@gear), notice: 'Review was successfully created.'
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
    @review.destroy
    redirect_to gear_path(@gear), notice: 'Review was successfully deleted.'
  end
  
  def update
    if @review.update(review_params)
      redirect_to gear_path(@gear), notice: 'Review was successfully updated.'
    else
      render 'edit'
    end
  end



  private
    def review_params
      params.require(:review).permit(:rating, :comment)
    end

    def find_gear
      @gear = Gear.find(params[:gear_id])
    end

    def find_review
      @review = Review.find(params[:id])
    end
end
