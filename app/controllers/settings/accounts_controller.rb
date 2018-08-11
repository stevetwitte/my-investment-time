module Settings
  class AccountsController < ApplicationController
    before_action :load_resource

    def edit
    end

    def update
      if @user.update(helpers.only_new_params(account_params, current_user))
        flash[:notice] = 'successfully updated account'
        redirect_to edit_settings_account_path
      else
        render :edit
      end
    end

    private

    def account_params
      params.require(:user).permit(:email,
                                   :username)
    end

    def load_resource
      @user = current_user
    end
  end
end
