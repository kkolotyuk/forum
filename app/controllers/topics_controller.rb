class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    render json: @topics
  end

  def create
    @topic = Topic.new(params[:topic])
    @topic.save
    render json: @topic
  end

  def show
    @topic = Topic.find(params[:id])
    render json: @topic
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.update_attributes(params[:topic])
  end

  def destroy
    @product = Topic.find(params[:id])
    @product.destroy
    #render head :no_content
    render json: {}
  end

end
