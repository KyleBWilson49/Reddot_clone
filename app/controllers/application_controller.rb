class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def is_moderator
    @sub = Sub.find(params[:id])

    if current_user.id != @sub.moderator_id
      redirect_to sub_url(@sub)
    end
  end

  def is_author
    @post = Post.find(params[:id])

    if current_user.id != @post.author_id
      redirect_to sub_post_url(@post.sub_id, @post)
    end
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end
end
