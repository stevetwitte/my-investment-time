class LikesController < ApplicationController
  def create
    @invest = Invest.find_by_id!(params[:invest_id])
    if current_user.likes.where(invest: @invest).blank?
      Like.create!(user: current_user, invest: @invest)
    end

    redirect_to invest_path(params[:invest_id])
  end

  def destroy
    @invest = Invest.find_by_id!(params[:invest_id])
    unless current_user.likes.where(invest: @invest).blank?
      Like.where(user: current_user, invest: @invest).destroy_all
    end

    redirect_to invest_path(params[:invest_id])
  end
end