class SessionsController < ApplicationController
  before_action :confirm_logged_in, except: [:new, :login, :create, :logout]

  def new
    @user = User.new
    render "new"
  end

  def login
    # login form
  end

  def create
    if params[:Username].present?
      user = User.where(:username => params[:Username])
      if user.empty?
        binding.pry
      else
        binding.pry
        flash[:notice] = "Someone has taken this Username"
        redirect_to new_path
        # authorized_user = found_user.authenticate(params[:password])
      end
    end
    # if authorized_user
    #   # mark user as logged in
    #   session[:user_id] = authorized_user.id
    #   session[:username] = authorized_user.username
    #   flash[:notice] = "You are now logged in."
    #   binding.pry
    # else
    #   binding.pry
    #   flash[:notice] = "Invalid username/password combination."
    #   redirect_to(:action => 'login')
    # end
  end

  def logout
    # mark user as logged out
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end

  # def new
  # end
  #
  # def create
  #   user = User.find_by(username: params[:username])
  #   if user && user.authenticate(params[:password])
  #     session[:current_user_id] = user.id
  #     redirect_to user
  #   else
  #     flash[:login_error] = "Password does not match log-in."
  #     #renamed :login_error for clarity.
  #     redirect_to login_path
  #   end
  #
  # end
  #
  # def destroy
  #   session[:current_user_id] = nil
  #   redirect_to root_path
  # end

  private

    def user_params
      params.require(:user).permit
    end


end
