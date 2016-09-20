class Api::V1::PagesController < ApplicationController
  def index
    @sitters = User.where("user_type LIKE ?", "SITTER")
    @posts = JobPost.all
    render json: @sitters
    # render json: @posts
  end
end