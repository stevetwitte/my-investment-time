require 'rails_helper'

RSpec.describe StatusesController, type: :controller do
  describe 'GET #new' do
    let!(:user_one) { create :user }
    let!(:user_two) { create :user }

    context 'with the owner of the invest' do
      before :each do
        2.times do
          create :invest, user: user_one
        end

        sign_in_as(user_one)
        get :new, params: { invest_id: Invest.first }
      end

      it 'returns http success' do
        expect(response).to have_http_status :ok
      end

      it 'returns a status and invest instance variable' do
        expect(assigns(:invest)).to be_valid
        expect(assigns(:status)).to be_truthy
      end
    end

    context 'with another user not owner of the invest' do
      before :each do
        2.times do
          create :invest, user: user_one
        end

        sign_in_as(user_two)
        get :new, params: { invest_id: Invest.first }
      end

      it 'returns http found' do
        expect(response).to have_http_status :found
      end

      it 'redirects to root url' do
        expect(response).to redirect_to :sign_in
      end
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let!(:user_one) { create :user }
      let!(:invest) { create :invest, user: user_one }

      before :each do
        sign_in_as(user_one)
        post :create, params: { invest_id: invest.id, status: FactoryBot.attributes_for(:status, invest: invest) }
      end

      it 'returns http found' do
        expect(response).to have_http_status :found
      end

      it 'redirects to the root url' do
        expect(response).to redirect_to invest_path(invest)
      end

      it 'creates an invest' do
        expect(Invest.all.length).to eql 1
      end
    end
  end
end