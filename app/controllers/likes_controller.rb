class LikesController < ApplicationController

  def add_like_to_database
    Like.create({user_id: session[:current_user_id], interest_id: params[:id]})
    user = User.find(session[:current_user_id])
    interest_likes = User.find(params[:id]).interests
    if interest_likes.include?(user)
      flash[:message] = "It is a match"
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end
