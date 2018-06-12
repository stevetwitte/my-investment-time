class StatusesController < ApplicationController
  before_action :authorize_status
  def new
    @invest = Invest.find_by_id!(params["invest_id"])
    @status = Status.new()
    @status.invest = @invest
  end

  def create
    @invest = Invest.find_by_id!(params["invest_id"])
    @status = Status.new()
    @status.invest = @invest
    @status.title = status_params[:title]
    @status.detail = status_params[:detail]

    if @status.save
      redirect_to invest_path(@status.invest)
    else
      render :new
    end
  end

  private

  def authorize_status
    unless Invest.find_by_id!(params["invest_id"]).user == current_user
      raise CanCan::AccessDenied
    end
  end

  def status_params
    params.require(:status).permit(:title,
                                   :detail)
  end
end