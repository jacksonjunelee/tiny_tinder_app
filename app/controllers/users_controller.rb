class UsersController < ApplicationController
  before_action :confirm_logged_in

  def index
    user = User.find(session[:current_user_id])
    @interest = user.find_interest
    if @interest == nil
      flash[:message] = "No more Matches"
    end
  end

  def matches
    @user = User.find(session[:current_user_id])
    interests = @user.interests
    @matches = []
    interests.each do |match|
      if match.interests.include?(@user)
        matches.push(match)
      end
    end
  end
end
