class UsersController < ApplicationController
  before_action :confirm_logged_in

  def index
    user = User.find(session[:current_user_id])
    @interest = user.find_interest
    if @interest == nil
      flash[:message] = "No more Matches"
    end
  end
  
end
