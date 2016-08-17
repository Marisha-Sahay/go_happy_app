class UsersController < ApplicationController

def new
  user = User.new
end

def create
  user = User.new(name: params[:name], address: params[:address],email: params[:email], password: params[:password],
      password_confirmation: params[:password_confirmation], user_type: params[:user_type])
  if user.save
    flash[:success] = "Welcome #{user.name}"
    redirect_to "/"
  else
    flash[:warning] = "Account not created, please try again"
    redirect_to "/signup"
  end
end

def show
  @user = User.find_by(id: params[:id])
end

def index
  if @current_user && @current_user.user_type == "SEEKER"
    @users = User.where("user_type LIKE ?", "SITTER")
  elsif @current_user && @current_user.user_type == "SITTER"
    @users = User.where("user_type LIKE ?", "SEEKER")
  else
    @users = User.all
  end
end
end