class Api::V1::PagesController < ApplicationController
  def sitter
    @sitters = User.where("user_type LIKE ?", "SITTER")
    render json: @sitters
    # render json: @posts
  end
  def job
    @posts = JobPost.all
    render json: @posts
  end
end