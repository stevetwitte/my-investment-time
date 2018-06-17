class PasswordsController < Clearance::PasswordsController
  private

  def find_user_by_id_and_confirmation_token
    user_param = Clearance.configuration.user_id_parameter
    token = params[:token] || session[:password_reset_token]

    Clearance.configuration.user_model.
        find_by_username_and_confirmation_token params[user_param], token.to_s
  end
end
