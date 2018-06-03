class InvestsController < ApplicationController
  load_and_authorize_resource
  skip_before_action :require_login, only: :index

  def index
    @invests = @invests.order('created_at DESC').page(params[:page])
  end

  def show
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
                                   :body,
                                   links: [:homepage,
                                           :github])
  end
end
