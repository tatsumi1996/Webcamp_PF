class SupportsController < ApplicationController
  
  def index
    @supports = Support.all
    @support = Support.new
  end

  def create
    @support = Support.new(support_params)
    @support.user_id = current_user.id
    if @support.save
      redirect_to support_path(@support), notice: "応援の投稿が完了しました。"
    else
      @supports = Support.all
      render 'index'
    end
  end
  
  def show
    @support_new = Support.new
    @support = Support.find(params[:id])
    @user = @support.user
    @comment = Comment.new
    @comments = @support.comments
  end
  
  def edit
    @support = Support.find(params[:id])
  end

  def update
    @support = Support.find(params[:id])
    if @support.update(support_params)
      redirect_to support_path(@support), notice: "応援投稿を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @support = Support.find(params[:id])
    @support.destroy
    redirect_to support_path
  end

  private

  def support_params
    params[:support].permit(:title, :body)
  end
  
end