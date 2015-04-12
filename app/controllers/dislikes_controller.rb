class DislikesController < ApplicationController

  def add_unlike_to_database
    Dislike.create({user_id: session[:current_user_id], disinterest_id: params[:id]})
    redirect_to root_path
  end
end
