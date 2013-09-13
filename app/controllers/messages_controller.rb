class MessagesController < ApplicationController
  respond_to :json

  def index
    @messages = Topic.find(params[:topic_id]).messages
  end

  def create
    @message = Message.new(params[:message])
    @message.save
    render :show
  end

  def update
    @message = Message.find(params[:id])
    @message.update_attributes(params[:message])
    render :show
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    render json: {}
  end
end
