class PostsController < ApplicationController
  before_action :load_post, only: %i(show update)
 
  def index
    @posts = Post.all
  end

  def show
    @versions = @post.versions.where.not(event: "create")
  end

  def update
    @post.update title: FFaker::Lorem.sentence, content: FFaker::Lorem.paragraphs.join

    redirect_to @post
  end

  private

  def load_post
    @post = Post.find_by id: params[:id]

    redirect_to root_url unless @post
  end
end
