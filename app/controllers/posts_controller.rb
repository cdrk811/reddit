# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_account!, except: %i[index show]
  before_action :set_post, only: :show

  def index
    @posts = Post.all
  end

  def show; end

  def new
    set_community
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.account_id = current_account.id
    @post.community_id = params[:community_id]

    if @post.save
      redirect_to community_path(@post.community_id)
    else
      set_community
      render :new
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_community
    @community = Community.find(params[:community_id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
