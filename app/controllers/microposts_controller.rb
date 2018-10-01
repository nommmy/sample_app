class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
   before_action :correct_user,   only: :destroy

  def create
     @micropost = current_user.microposts.build(micropost_params)
     set_reply_id
     if @micropost.save
       flash[:success] = "Micropost created!"
       redirect_to root_url
     else
       @feed_items = []
       render 'static_pages/home'
     end
   end

   def destroy
      @micropost.destroy
      flash[:success] = "Micropost deleted"
      redirect_to request.referrer || root_url
    end


   private

   def micropost_params
    params.require(:micropost).permit(:content, :picture, :in_reply_to)
  end

     def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

    def set_reply_id
      if user_name = @micropost.content.match(/^@(.+?)\s(.+?)\s/)
        user = User.find_by(name: user_name[1] + ' ' + user_name[2])
        if !user.nil?
          @micropost.in_reply_to = user.id
        end
      end
    end
end
