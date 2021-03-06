class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include PermissionsHelper

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
