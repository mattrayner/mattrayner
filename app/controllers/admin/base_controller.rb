# A base controller, inherited by all Admin controllers.
# Ensures the correct layout is used and that a user is authenticated.
#
# @author Matthew Rayner
# @since 0.1
class Admin::BaseController < ApplicationController
  before_filter :authenticate_user!

  layout 'admin'
end