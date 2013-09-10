class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def create
    @topic = Topic.new(params[:topic])
    @topic.save
    render :show
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.update_attributes(params[:topic])
    render :show
  end

  def destroy
    @product = Topic.find(params[:id])
    @product.destroy
    render head :no_content
  end
end
