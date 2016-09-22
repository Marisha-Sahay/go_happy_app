class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], address: params[:address], phone_no: params[:phone_no], email: params[:email], password: params[:password],
      password_confirmation: params[:password_confirmation], user_type: params[:user_type], image_url: params[:image_url])
  # binding.pry
  if @user.save
    flash[:success] = "Welcome #{@user.first_name}"
    session[:user_id] = @user.id
    UserMailer.welcome_email(@user.email).deliver_now  
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
  user.image_url = params[:image_url]
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
  if @users
  else
    if type? == "SEEKER"
      @users = User.where("user_type LIKE ?", "SEEKER")
    elsif type? == "SITTER"
      @users = User.where("user_type LIKE ?", "SITTER")
    else
      @users = User.all
    end
  end
end

def home
  if type? == "SEEKER"
    redirect_to '/profiles'
  elsif type? == "SITTER"
    redirect_to '/jobposts'
  end
end

def destroy
  user = User.find_by(id: params[:id])
  user.delete
  flash[:danger] = "We are sad to see you go.. User account deleted"
  redirect_to "/"
end

def search
  @users = User.where("first_name LIKE ? OR last_name LIKE ? OR address LIKE ?", "%#{params[:user_search]}%", "%#{params[:user_search]}%", "%#{params[:user_search]}%")
  render :index
end
end