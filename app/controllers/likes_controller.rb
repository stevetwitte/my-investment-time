class LikesController < ApplicationController
  before_action :load_resources

  def create
    if current_user.likes.where(invest: @invest).blank?
      Like.create!(user: current_user, invest: @invest)
    end

    respond_to do |format|
      format.json do
        render json: { invest_likes: @invest.likes.length },
               status: :ok, location: @user
      end
    end
  end

  def destroy
    unless current_user.likes.where(invest: @invest).blank?
      Like.where(user: current_user, invest: @invest).destroy_all
    end

    respond_to do |format|
      format.json do
        render json: { invest_likes: @invest.likes.length },
               status: :ok, location: @user
      end
    end
  end

  private

  def load_resources
    @invest = Invest.find_by_id!(params[:invest_id])
  end
end