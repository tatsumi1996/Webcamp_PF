class Admin::FavoriteTeamsController < ApplicationController
    before_action :authenticate_admin!, except: [:show]
    skip_before_action :authenticate_user!

  def index
    @favorite_team = FavoriteTeam.new
    @favorite_teams = FavoriteTeam.all.page(params[:page]).per(10)
  end

  def create
    @favorite_team = FavoriteTeam.new(favorite_team_params)
    if @favorite_team.save
       flash[:notice] = "球団を追加しました"
       redirect_to admin_favorite_teams_path
    else
      @favorite_teams = FavoriteTeam.all.page(params[:page]).per(10)
      render :index and return
    end
  end

  def edit
    @favorite_team = FavoriteTeam.find(params[:id])
  end

  def update
    @favorite_team = FavoriteTeam.find(params[:id])
    if @favorite_team.update(favorite_team_params)
      flash[:success] = "球団を変更しました"
      redirect_to admin_favorite_teams_path
    else
       render :edit and return
    end
  end

  private

  def favorite_team_params
    params.require(:favorite_team).permit(:name, :image)
  end
end
