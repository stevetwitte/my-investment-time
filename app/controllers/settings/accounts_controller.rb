module Settings
  class AccountsController < ApplicationController
    def edit
      @user = current_user
    end

    def update
      @user = current_user

      if @user.update(only_new_params(account_params, current_user))
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

    def only_new_params(parameters, model)
      parameters.each do |k, v|
        if v == model[k]
          parameters.delete(k)
        end
      end
    end
  end
end
