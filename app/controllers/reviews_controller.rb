class ReviewsController < ApplicationController
  def new
    
  end

  def create
    @profile = Profile.find_by(id: params[:user_id])
    review = Review.new(name: current_user.first_name, review: params[:review], user_id: @profile.user_id, reviewer_image: current_user.image_url)
    if review.save
      redirect_to "/profile/#{@profile.id}"
    end
  end

end
