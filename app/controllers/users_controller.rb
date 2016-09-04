class UsersController < ApplicationController

def new
  @user = User.new
end

def create
  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], address: params[:address], phone_no: params[:phone_no], email: params[:email], password: params[:password],
      password_confirmation: params[:password_confirmation], user_type: params[:user_type])
  if @user.save
    flash[:success] = "Welcome #{@user.first_name}"
    redirect_to "/"
  else
    flash[:warning] = "Account not created, please try again"
    render :new
  end
end

def edit
  @user = User.find_by(id: params[:id])
end

def update
  user = User.find_by(id: params[:id])
  user.first_name = params[:first_name]
  user.last_name =  params[:last_name]
  user.address = params[:address]
  user.phone_no = params[:phone_no]
  user.password = params[:password]
  user.password_confirmation = params[:password_confirmation]
  user.user_type = params[:user_type]
  if user.save
    flash[:success] = "Your account is successfully updated."
    redirect_to "/users/#{user.id}"
  else
    render :edit
  end
end

def show
  @user = User.find_by(id: params[:id])
end

def index
  if current_user && current_user.user_type == "SEEKER"
    @users = User.where("user_type LIKE ?", "SITTER")
  elsif current_user && current_user.user_type == "SITTER"
    @users = User.where("user_type LIKE ?", "SEEKER")
  else
    @users = User.all
  end
end

def home
    @users = User.where("user_type LIKE ?", "SITTER")
    @posts = JobPost.all
end

end