class TeamsController < ApplicationController
  load_and_authorize_resource find_by: :slug

  def index
    @owned_teams = @teams.where(owner: current_user)
    @member_teams = current_user.teams
  end

  def create
    if @team.save
      redirect_to team_url(@team)
    else
      render :new
    end
  end

  def update
    if @team.update(team_params)
      flash[:notice] = "successfully updated team"
      redirect_to team_path(@team)
    else
      render :edit
    end
  end

  private

  def team_params
    params.require(:team).permit(:name,
                                 :slug,
                                 :description,
                                 links: [:homepage,
                                         :github])
  end
end
