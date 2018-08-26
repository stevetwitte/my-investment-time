require "rails_helper"

RSpec.describe Activities::NotificationsController, type: :controller do
  describe "DELETE #destroy" do
    let!(:user) { create :user }
    let!(:invest) { create :invest }
    let!(:activity_notification) do
      create :activity_notification, invest: invest, user: user
    end

    before :each do
      sign_in_as user
      delete :destroy, params: { id: activity_notification.id }
    end

    it "returns http found" do
      expect(response).to have_http_status :found
    end

    it "redirects to the notifications url" do
      expect(response).to redirect_to activities_index_path
    end

    it "updates the status of the Activity::Notification to dismissed" do
      activity_notification.reload
      expect(activity_notification.status).to eql "dismissed"
    end
  end

end