class PostsController < ApplicationController
  before_action :load_post, only: %i(show)
 
  def index
    @posts = Post.all
  end

  def show
    @versions = @post.versions
  end

  private

  def load_post
    @post = Post.find_by id: params[:id]

    redirect_to root_url unless @post
  end
end
