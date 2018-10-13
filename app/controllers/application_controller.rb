class ApplicationController < ActionController::Base
  include Clearance::Controller
  include CanCan::ControllerAdditions

  # TODO: rescue from ActiveRecord Exceptions
  rescue_from CanCan::AccessDenied, with: :not_authorized

  before_action :require_login

  private

  def not_authorized
    redirect_to sign_in_path
  end

end
