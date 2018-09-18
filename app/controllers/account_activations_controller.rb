class AccountActivationsController < ApplicationController
  # !user.activated?で初回だけ有効化。ないと後からメール盗んだ人がそこからログインできちゃう
  # mailのurlが持ってるやつとuserが持ってるやつを比べる
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Account activated!"
      redirect_to user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
