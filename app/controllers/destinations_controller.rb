class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end

  def show
    id = params[:id]
    @destination = Destination.find(id)
  end

  def new
    @destination = Destination.new
  end

  def create
  end

  def edit
  end


  def delete
  end

  def update
  end
end
