class JobpostsController < ApplicationController
  def new
  end

  def create
    post = JobPost.new(title: params[:title], description: params[:description], days: params[:days], time: params[:time], birthdate: params[:birthdate], desired_enrollment_date: params[:desired_enrollment_date], user_id: current_user.id)
      if post.save
        flash[:success] = "Your job is posted"
        redirect to '/jobs/#{post.id}'
      else
        flash[:warning] = "Oops! something went wrong, try again"
        redirect_to "/jobs/new"
      end
  end

  def show
    @post = JobPost.find_by(id: params[:id])
  end

  def index
    @posts = JobPost.all
  end

  def edit 
    @post = JobPost.find_by(id: params[:id])
  end

  def destroy
    @post = JobPost.find_by(id: params[:id])
    @post.destroy
  end

end
