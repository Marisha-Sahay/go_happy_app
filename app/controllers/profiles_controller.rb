class ProfilesController < ApplicationController

  def new
    profile = Profile.new
  end
  
  def create
    if Profile.find_by(user_id: current_user.id)
      flash[:warning] = "You can have only one profile. Try to edit your current profile if required."
      redirect_to "/profile/#{current_user.profile.id}/edit"
    elsif current_user && current_user.user_type == "SITTER"
      profile = Profile.new(user_id: current_user.id,gender: params[:gender], age: params[:age], cpr: params[:cpr], first_aid: params[:first_aid], trustline: params[:trustline], comfortable_with_pets: params[:comfortable_with_pets], description: params[:description], preferred_age_group: params[:preferred_age_group], education: params[:education], languages: params[:languages], type_of_job: params[:type_of_job], availability: params[:availability])
    if profile.save
      flash[:success] = "Congratulations! You have successfully created your profile"
      redirect_to "/profile/#{profile.id}"
    else
      flash[:warning] = "Only a babysitter can create a profile. Also, make sure you are logged in."
      redirect_to "/"
    end
  end
end

  def edit
    @profile = Profile.find_by(id: params[:id])
  end

  def update
    if current_user && current_user.user_type == "SITTER" 
      profile = Profile.find_by(id: params[:id])
      profile.user_id = current_user.id
      profile.gender = params[:gender]
      profile.age = params[:age]
      profile.cpr = params[:cpr]
      profile.first_aid = params[:first_aid]
      profile.trustline = params[:trustline]
      profile.comfortable_with_pets = params[:comfortable_with_pets]
      profile.description = params[:description]
      profile.preferred_age_group = params[:preferred_age_group]
      profile.education = params[:education]
      profile.languages = params[:languages]
      profile.type_of_job = params[:type_of_job]
      profile.availability = params[:availability]
      profile.save
      flash[:success] = "Profile updated"
      redirect_to "/profile/#{profile.id}"
    else
      flash[:warning] = "You need to be logged in to edit your profile"
      redirect_to "/login"
    end
  end


  def show
    @sitters = User.where(user_type: "SITTER").where.not(id: current_user.id).limit(4)
    if current_user 
      @profile = Profile.find_by(id: params[:id])
    end
    user = User.find_by(id: @profile.user_id)
    @reviews = Review.where(user_id: user.id)
end

def index
  @sitters = User.where(user_type: "SITTER")
end

end
