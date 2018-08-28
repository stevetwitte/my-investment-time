module Activities
  class NotificationsController < ApplicationController
    def update
      @notification = current_user.activity_notifications.find_by(id: params[:id])

      unless @notification.update(status: params[:status])
        flash[:notice] = "there was a problem dismissing the notification"
      end

      if params[:view] == "true"
        redirect_to invest_path(@notification.invest)
      else
        redirect_to activities_index_path
      end
    end
  end
end