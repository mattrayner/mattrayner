# Namespace for a set of helper methods and classes available within the admin
# section of the application.
# @since 0.6.0
module Admin
  # A base controller, inherited by all Admin controllers.
  # Ensures the correct layout is used and that a user is authenticated.
  #
  # @author Matthew Rayner
  # @since 0.1
  class BaseController < ApplicationController
    before_filter :authenticate_user!

    layout 'admin'
  end
end
