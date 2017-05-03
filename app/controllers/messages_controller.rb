class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all
  end

  def show
    @messages = Message.find(message_params)
  end

  def new
    set_message
    @message = Message.new(message_params)
  end

  def edit
  end

  def create
    set_message
    @message = Message.new(message_params)
    if @message.save
      redirect_to sms_send_path
    else
      redirect_to root_path
    end
  end

  def update
      if @message.update(message_params)
        redirect_to @message
      else
        render :edit
      end
  end

  def destroy
    @message.destroy
    respond_to do |format|
      redirect_to messages_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(message_params)
    end

    # Never trust parameters from the scary internet, only allowset_message the white list through.
    def message_params
      params.require(:message).permit(:number, :text)
    end
    
end
