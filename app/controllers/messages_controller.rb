class MessagesController < ApplicationController
  def create
     @message = current_user.messages.build(message_params)
     if @message.save
       flash[:success] = "Message created!"
       redirect_back(fallback_location: root_path)
     else
       render 'static_pages/home'
     end
  end


  private

  def message_params
   params.require(:message).permit(:content, :reception_id)
 end
end
