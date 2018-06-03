require 'rails_helper'

RSpec.describe InvestsController, type: :controller do

  describe "GET #index" do
    before :each do
      10.times do
        create :invest
      end

      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status :ok
    end

    it "returns invests in instance variable" do
      expect(assigns(:invests).length).to be 10
    end
  end

  describe "GET #index with search params" do
    before :each do
      10.times do
        create :invest
      end

      create(:invest, title: 'Testing One Two Three')

      get :index, params: { search: 'testing one two three' }
    end

    it "returns http success" do
      expect(response).to have_http_status :ok
    end

    it "returns one matching invest in invests instance variable" do
      expect(assigns(:invests).length).to be 1
      expect(assigns(:invests).first.title).to eql 'Testing One Two Three'
    end
  end

  describe "GET #show" do
    before :each do
      10.times do
        create :invest
      end

      sign_in
      get :show, params: { id: Invest.first.id }
    end

    it "returns http success" do
      expect(response).to have_http_status :ok
    end

    it "returns invest in instance variable" do
      expect(assigns(:invest)).to be_valid
    end
  end

  describe "GET #new" do
    before :each do
      sign_in
      get :new
    end

    it "returns http found" do
      expect(response).to have_http_status :ok
    end

    it "has an instance variable of a new invest" do
      expect(assigns(:invest)).to be_a_new Invest
    end
  end

  describe "POST #create" do
    before :each do
      sign_in
      post :create, params: { invest: FactoryBot.attributes_for(:invest) }
    end

    it "returns http found" do
      expect(response).to have_http_status :found
    end

    it "redirects to the root url" do
      expect(response).to redirect_to root_url
    end

    it "creates an invest" do
      expect(Invest.all.length).to eql 1
    end
  end
end
