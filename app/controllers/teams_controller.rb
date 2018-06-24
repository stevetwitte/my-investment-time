class TeamsController < ApplicationController
  load_and_authorize_resource

  def index
    @teams = @teams.order('created_at DESC').page(params[:page])
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
