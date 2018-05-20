require 'rails_helper'

RSpec.describe "invests/index.html.erb", type: :view do
  context "with 5 invests" do
    before :each do
      create(:invest, title: "Some kinda Invest one")
      create(:invest, title: "Some kinda Invest two")
      assign(:invests, Invest.all.order('created_at DESC').page(params[:page]))
    end

    it "displays all the invests" do
      render

      expect(rendered).to match /Some kinda Invest one/
      expect(rendered).to match /Some kinda Invest two/
    end
  end
end
