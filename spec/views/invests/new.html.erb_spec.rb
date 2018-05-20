require 'rails_helper'

RSpec.describe "invests/new.html.erb", type: :view do
  context "with a logged in user" do
    before :each do
      sign_in
      assign(:invest, build(:invest))
    end

    it "displays a new form" do
      render

      expect(rendered).to match /new investment/
    end
  end
end
