class LikesController < ApplicationController
  def create
    @likee = current_user.likes.create(support_id: params[:support_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @support = Support.find(params[:support_id])
    @like = current_user.likes.find_by(support_id: @support.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
