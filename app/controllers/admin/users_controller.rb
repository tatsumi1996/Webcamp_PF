class Admin::UsersController < ApplicationController
  
    before_action :authenticate_admin!

  def index
    @uses = User.all.page(params[:page]).per(10)
	end

	def show
	@user = User.find(params[:id])
	end

	def edit
	@user = User.find(params[:id])
	end

	def update
	@user = User.find(params[:id])
		if @user.update(user_params)
		   flash[:success] = "会員情報を変更しました"
		   redirect_to admin_user_path
		else
			render "edit"
		end

	end

	private
	def customer_params
	  params.require(:user).permit(:nickname,:profile_image,:email,:is_deleted)
	end
end

