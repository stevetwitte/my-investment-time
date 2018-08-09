module Settings
  class PasswordsController < ApplicationController
    before_action :load_resource

    def edit
    end

    def update
      if @user.authenticated?(password_params[:current_password]) &&
         @user.update(password: password_params[:new_password])
        flash[:notice] = "successfully updated password"
        redirect_to edit_settings_password_path
      else
        flash[:error] = "password update failed"
        render :edit
      end
    end

    private

    def password_params
      params.require(:user).permit(:current_password,
                                   :new_password)
    end

    def load_resource
      @user = current_user
    end
  end
end
