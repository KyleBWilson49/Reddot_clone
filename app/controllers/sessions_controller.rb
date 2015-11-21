class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(
        params[:user][:email],
        params[:user][:password]
    )

    if @user.nil?
      flash.now[:errors] = @user.errors.full_messages
      render :new
    else
      login!(@user)
      redirect_to subs_url
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
