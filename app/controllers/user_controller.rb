class UserController < ApplicationController
  before_action :authenticate_user!
  def index

  end

  def destroy
    user_id = params[:user_id]
    user = User.find_by_id(user_id)
    if user
      FavoriteMovie.where(user_id: user_id).destroy_all rescue nil
      user.destroy
    end
    redirect_back fallback_location: root_path
  end

  def show
    @user = User.find_by_user_name(params[:user_name])
  end
end
