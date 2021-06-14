class UsersController < ApplicationController
    before_action :ensure_correct_user, only: [:update]

  def show
    @user = User.find(params[:id])
    @supports = @user.supports
    @support = Support.new
  end

  def index
    @users = User.all
    @support = Support.new
  end

  def edit
    @user = User.find(params[:id])
    if current_user != @user
		  flash[:notice] = "権限がありません"
		  redirect_to user_path(current_user)
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "アカウント情報の更新が完了しました。"
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
