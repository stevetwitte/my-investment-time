class FollowsController < ApplicationController
  before_action :load_resources

  # TODO: This endpoint is acting as a toggle (refactor)
  def create
    if current_user.follows.where(invest: @invest).blank?
      Follow.create!(user: current_user, invest: @invest)
      is_following = true
    else
      Follow.where(user: current_user, invest: @invest).destroy_all
      is_following = false
    end

    render json: { is_following: is_following },
           status: :ok
  end

  private

  def load_resources
    @invest = Invest.find_by_id!(params[:invest_id])
  end
end
