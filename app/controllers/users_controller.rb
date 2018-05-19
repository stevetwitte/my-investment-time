class UsersController < Clearance::UsersController

  private

  def user_from_params
    email = user_params.delete(:email)
    username = user_params.delete(:username)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.username = username
      user.password = password
    end
  end
end