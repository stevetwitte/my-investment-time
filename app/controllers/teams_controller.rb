class TeamsController < ApplicationController
  load_and_authorize_resource

  def index
    @owned_teams = @teams.where(owner: current_user)
    @member_teams = current_user.teams
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def team_params
    params.require(:team).permit(:name,
                                 :slug,
                                 :description)
  end
end
