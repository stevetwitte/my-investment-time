class ActivitiesController < ApplicationController
  before_action :load_activities

  private

  def load_activities
    @invitations = current_user.activity_invites
    @notifications = current_user.activity_notifications
  end
end
