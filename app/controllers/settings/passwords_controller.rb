module Settings
  class PasswordsController < ApplicationController
    def edit
      @user = current_user
    end

    def update
      @user = current_user

      if @user.authenticated?(password_params[:current_password]) &&
         @user.update(password: password_params[:new_password])
        flash[:notice] = 'successfully updated password'
        redirect_to edit_settings_password_path
      else
        flash[:error] = 'password update failed'
        render :edit
      end
    end

    private

    def password_params
      params.require(:user).permit(:current_password,
                                   :new_password)
    end
  end
end
