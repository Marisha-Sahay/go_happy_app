class ReviewsController < ApplicationController
  def new
    
  end

  def create
    @profile = Profile.find_by(id: params[:user_id])
    review = Review.new(name: params[:name], review: params[:review], user_id: @profile.user_id)
    if review.save
      redirect_to "/profile/#{@profile.id}"
    end
  end

end
