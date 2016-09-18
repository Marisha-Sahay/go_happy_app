class JobpostsController < ApplicationController
  def new
  end

  def create
    if current_user
      post = JobPost.new(title: params[:title], description: params[:description], days: params[:days], time: params[:time], birthdate: params[:birthdate], desired_enrollment_date: params[:desired_enrollment_date], user_id: current_user.id, salary: params[:salary])
      if post.save
        flash[:success] = "Your job is posted"
        redirect_to '/jobposts/#{post.id}'
      else
        flash[:warning] = "Oops! something went wrong, try again"
        redirect_to "/jobposts/new"
      end
    else
      flash[:warning] = "You need to login to create a job"
      redirect_to '/login'
    end
  end

  def show
    @post = JobPost.find_by(id: params[:id])
  end

  def index
    if @posts
    else
      if current_user && type? == 'SEEKER'
        @posts = JobPost.where(user_id: current_user.id)
        if @posts.empty?
          redirect_to '/jobposts/new'
        end
      # throw 'ggh'
      elsif current_user && type? == 'SITTER'
        @posts = JobPost.all
      end
    end
  end

def edit 
  @post = JobPost.find_by(id: params[:id])
end

def update
  post = JobPost.find_by(id: params[:id])
  post.title = params[:title]
  post.description = params[:description]
  post.days = params[:days]
  post.time = params[:time]
  post.birthdate = params[:birthdate]
  post.desired_enrollment_date = params[:desired_enrollment_date]
  post.user_id = current_user.id
  post.salary = params[:salary]
  post.save
  flash[:success] = "Job Post updated"
  redirect_to "/jobposts/#{post.id}"
end

def destroy
  post = JobPost.find_by(id: params[:id])
  post.delete
  flash[:danger] = "JobPost deleted"
  redirect_to "/jobposts"
end

def search
  @posts = JobPost.where("title LIKE ? OR description LIKE ? OR salary LIKE ?", "%#{params[:jobpost_search]}%", "%#{params[:jobpost_search]}%", "%#{params[:jobpost_search]}%")
  render :index
end
end
