class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :login_required, only: [:show, :edit, :update]
  before_action :current_user_only, only: [:edit, :update]

  def signup
    @user = User.new
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(set_form_data)
        format.html { redirect_to user_path, notice: "Profile Updated Succcessfully!!" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def create
    @user = User.new(set_form_data)
    respond_to do |format|
      if @user.save
        format.html { redirect_to articles_path, notice: "Welcome to Rails Blog" }
      else
        format.html { render :signup, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_form_data
    params.require(:user).permit(:email, :username, :full_name, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def current_user_only
    if @user != authenticated_user
      flash[:alert] = "Unauthorized User access denied!!!"
      redirect_to user_login_path
    end
  end
end
