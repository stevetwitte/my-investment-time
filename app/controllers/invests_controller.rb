class InvestsController < ApplicationController
  load_and_authorize_resource

  def index
    @invests = @invests.order('created_at DESC').page(params[:page])
  end

  def create
    if @invest.save
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def invest_params
    params.require(:invest).permit(:title,
                                   :body)
  end
end
