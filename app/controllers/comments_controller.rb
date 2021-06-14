class CommentsController < ApplicationController
  def create
    @support = Support.find(params[:support_id])
    @comment = current_user.comments.new(support_comment_params)
    @comment.support_id = @support.id
    @comment.save
      redirect_back(fallback_location: root_path)
  end

  def destroy
    @support = Support.find(params[:support_id])
    @comment = current_user.comments.find_by(support_id: @support.id)
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def support_comment_params
    params.require(:comment).permit(:body)
  end
end
