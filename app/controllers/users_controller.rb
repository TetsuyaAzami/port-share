class UsersController < ApplicationController
before_action :check_whether_correct_user, {only: [:edit,:update,:destroy]}
before_action :set_user,{only: [:show,:edit,:update,:destroy]}

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: "ユーザー編集を完了しました"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: "ユーザー #{@user.name}を削除しました。"
  end

  private
  def check_whether_correct_user #他ユーザーの情報を編集・削除できないように制限（管理者ユーザーは覗く）
    @user = User.find(params[:id])
    unless current_user.admin == true || current_user.id == @user.id
    redirect_to user_path(current_user),notice: "編集・削除権限がありません"
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email,:name,:profile)
  end
end
