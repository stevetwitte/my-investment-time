class InvestsController < ApplicationController
  load_and_authorize_resource

  def index
    @invests.order!('created_at DESC')
  end

  def new
  end

  def create
    puts @invest
    if @invest.save
      redirect_to root_url
    else

    end
  end

  def update
  end

  private

  def invest_params
    params.require(:invest).permit(:title,
                                   :body)
  end
end
