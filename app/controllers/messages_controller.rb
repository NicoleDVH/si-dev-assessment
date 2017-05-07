class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @message = Message.all
  end

  def show
  end

  def new
    @message = Message.new
  end

  def edit
  end
  
  def create
    @message = Message.create(message_params)
    send_sms(message_params)
    if @message.save
      redirect_to @message
    else 
      flash[:alert] = "Could not send message!"
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
    redirect_to messages_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allowset_message the white list through.
    def message_params
      params.require(:message).permit(:number, :text)
    end

    def send_sms(message_params)
    account_sid = ENV["TWILIO_SID"] 
    auth_token = ENV["TWILIO_TOKEN"] 
     
    @client = Twilio::REST::Client.new account_sid, auth_token
        
    message = @client.account.messages.create(:body => @message.text,
    :to => @message.number,
    :from => ENV["FROM"]) 
         
    rescue Twilio::REST::RequestError => e
  end
  
end
