class ApplicationController < ActionController::Base
  include Clearance::Controller
  include CanCan::ControllerAdditions
end
