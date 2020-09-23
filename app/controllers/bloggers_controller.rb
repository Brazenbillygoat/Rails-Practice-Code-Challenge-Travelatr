class BloggersController < ApplicationController
  before_action :find_blogger, only: [:show, :edit, :delete, :update]

  def index
    @bloggers = Blogger.all
  end

  def show
  #   id = params[:id]
  #   @blogger = Blogger.find(id)
  @most_liked_post = @blogger.find_most_liked_post()
  end

  def new
    @blogger = Blogger.new
  end

  def create
    # name = params["blogger"]["name"]
    # age = params["blogger"]["age"]
    # bio = params["blogger"]["bio"]
    @blogger = Blogger.new(blogger_params)
    if @blogger.save
      redirect_to blogger_path(@blogger.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def delete
  end


  private

  def blogger_params
    params.require(:blogger).permit(:name, :age, :bio)
  end

  def find_blogger
    @blogger = Blogger.find(params[:id])
  end

end
