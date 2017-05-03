class PagesController < ApplicationController
  
  def home
    @message = Message.new
  end

  def sms
    @message = Message.new
  end

end