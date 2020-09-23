class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :delete, :update]
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: params["post"]["title"], 
    content: params["post"]["content"], blogger_id: params["post"]["blogger_id"], destination_id: params["post"]["destination_id"])
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    if params[:add_like]
      @post.add_like
      redirect_to post_path(@post)
    end
    # if @post.update
    #   redirect_to post_path(@post)
    # else
    #   render :edit
    # end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
