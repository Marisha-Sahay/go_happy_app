class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :human_date_and_time
  helper_method :type?
  helper_method :gravatar_for

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def human_date_and_time(date)
    date.strftime("%b %e, %l:%M %p")
  end

  def authenticate_user!
    redirect_to '/login' unless current_user
  end

  def type?
    if current_user && current_user.user_type == 'SEEKER'
      return 'SEEKER'
    elsif current_user && current_user.user_type == 'SITTER'
      return 'SITTER'
    else
      return 'GUEST'
    end
  end

  def gravatar_for(user, opts = {})
    opts[:alt] = user.first_name
    # image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=#{opts.delete(:size) { 40 }}",
    #           opts
  end

end