class TopicsController < ApplicationController
  respond_to :json

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
    topic = Topic.find(params[:id])
    topic.destroy
    render json: {}
  end
end
