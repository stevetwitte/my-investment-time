class StatusesController < ApplicationController
  before_action :authorize_status
  before_action :load_resources

  def new
    @status.invest = @invest
  end

  def create
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

  def status_params
    params.require(:status).permit(:title,
                                   :detail)
  end

  def authorize_status
    unless Invest.find_by_id!(params["invest_id"]).user == current_user
      raise CanCan::AccessDenied
    end
  end

  def load_resources
    @invest = current_user.invests.find_by_id!(params["invest_id"])
    @status = Status.new
  end
end