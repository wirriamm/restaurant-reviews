class ReviewsController < ApplicationController
  before_action :find_restaurant, except: [:destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params) # this instance will carry the error message if validation fails
    @review.restaurant = @restaurant # important to link the review to an isntance of restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def destroy
    # Cannot find restaurant, bcos params not avail in destroy review path
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
