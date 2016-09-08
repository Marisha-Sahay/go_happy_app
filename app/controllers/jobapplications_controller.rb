class JobapplicationsController < ApplicationController

  def create
    @post = JobPost.find_by(id: params[:id])
    application = JobApplication.new(job_post_id: @post.id, user_id: current_user.id, information: params[:information])  
    # binding.pry
    # if application.save! => give the error you get when its not saving
    if application.save
      flash[:success] = "Your application has been sent. Look for other jobs you are interested in."
      redirect_to "/jobposts"
    else
      flash[:danger] = "Your application is not sent. Please try again."
      redirect_to "/jobposts"
    end
  end

end
