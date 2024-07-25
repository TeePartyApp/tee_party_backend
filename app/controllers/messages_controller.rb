class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find_by(id: params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    render :index
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      render json: @message, status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

private
  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
