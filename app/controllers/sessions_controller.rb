class SessionsController < ApplicationController
  def login
  end

  def create
    @user = User.find_by(email: params[:session][:email])

    respond_to do |format|
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user["id"]
        format.html { redirect_to @user, notice: "Logged In Successfully" }
      else
        flash.now[:alert] = "Invalid Credentials"
        format.html { render :login, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      session.delete(:user_id)
      format.html { redirect_to root_path, notice: "Logged Out Successfully" }
    end
  end
end
