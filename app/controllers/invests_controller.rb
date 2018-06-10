class InvestsController < ApplicationController
  load_and_authorize_resource
  skip_before_action :require_login, only: :index

  def index
    if params[:search]
      @invests = @invests.where('LOWER(title) LIKE ?', "%#{params[:search].downcase}%").order('created_at DESC').page(params[:page])
    else
      @invests = @invests.order('created_at DESC').page(params[:page])
    end
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

  def edit
  end

  def update
    if @invest.update(invest_params)
      flash[:notice] = 'successfully updated investment'
      redirect_to invest_path(@invest)
    else
      render :edit
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
