class UsersController < ApplicationController
  before_action :set_user,only: [:show]
  def show
    redirect_to user_path(current_user)
  end


  private

  def set_user
  @user = User.find(current_user.id)
  end
end

