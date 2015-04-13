class SessionsController < ApplicationController

  def new
    @user = User.new
    render "new"
  end

  def login
    # login form
  end

  def sign_in
    @user = User.where(:username => params[:username])[0]
    if !@user.nil?
      session[:current_user_id] = @user.id
      session[:username] = @user.username
      redirect_to root_path
    else
      redirect_to new_session_path
    end
    #sign_in
  end

  def create
    if params[:user].present?
      user = User.where(:username => params[:user][:username])
      if user.empty?
        @user = User.new(user_params)
        if @user.save
          session[:current_user_id] = @user.id
          session[:username] = @user.username
          redirect_to root_path
        else
          redirect_to new_session_path
        end
      else
        flash[:notice] = "Someone has taken this Username"
        redirect_to new_session_path
        # authorized_user = found_user.authenticate(params[:password])
      end
    end
  end

  def destroy
    # mark user as logged out
    session[:current_user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end

  private

    def user_params
      params.require(:user).permit(:username, :gender, :interested_gender, :age, :preferred_age)
    end


end
