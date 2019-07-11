class PostsController < ApplicationController
  before_action :load_post, only: %i(show update destroy restore)
  before_action :load_version, only: %i(restore)

  def index
    @posts = Post.all
  end

  def show
    @versions = @post.versions.where.not(event: "create")
  end

  def update
    @post.update_attributes title: FFaker::Lorem.sentence, content: FFaker::Lorem.paragraphs.join

    redirect_to @post
  end

  def restore
    @reify_post = @version.reify
    @post.update_attributes title: @reify_post.title, content: @reify_post.content

    redirect_to @post
  end

  private

  def load_post
    @post = Post.find_by id: params[:id]

    redirect_to root_url unless @post
  end

  def load_version
    @version = @post.versions.find_by id: params[:version_id]

    redirect_back(fallback_localtion: root_url) unless @version
  end
end
