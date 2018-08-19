class LikesController < ApplicationController
  before_action :load_resources

  # TODO: This endpoint is acting as a toggle (refactor)
  def create
    if current_user.likes.where(invest: @invest).blank?
      Like.create!(user: current_user, invest: @invest)
      is_liked = true
    else
      Like.where(user: current_user, invest: @invest).destroy_all
      is_liked = false
    end

    render json: { is_liked: is_liked,
                   invest_likes: @invest.likes.length },
           status: :ok
  end

  private

  def load_resources
    @invest = Invest.find_by_id!(params[:invest_id])
  end
end