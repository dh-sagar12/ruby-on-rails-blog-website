class ApplicationController < ActionController::Base
  helper_method :authenticated_user, :is_authenticated?, :is_admin?

  def authenticated_user
    @authenticated_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_authenticated?
    !!authenticated_user
  end

  def is_admin?
    authenticated_user.is_admin
  end

  def login_required(redirect_url: user_login_path)
    if !is_authenticated?
      redirect_to redirect_url
      flash[:alert] = "Unauthorized User access denied!!!"
    end
  end

  def admin_required(redirect_url: user_login_path)
    if !authenticated_user? && !is_admin?
      redirect_to redirect_url
      false[:alert] = "User lacks Permission to view this page"
    end
  end
end
