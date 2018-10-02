class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @messages = Message.where("user_id = ? or reception_id = ? ", current_user, current_user)
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
