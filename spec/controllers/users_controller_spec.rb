require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "GET #show" do
    before :each do
      5.times do
        create :user
      end

      sign_in
      get :show, params: { id: User.first.username }
    end

    it "returns http success" do
      expect(response).to have_http_status :ok
    end

    it "returns a user in instance variable" do
      expect(assigns(:user)).to be_valid
      expect(assigns(:user).email).to eql User.first.email
    end
  end

end