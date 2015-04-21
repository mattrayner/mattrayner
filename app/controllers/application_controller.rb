# A base controller, inherited by all controllers.
# Ensures the correct layout is used and provides some helper functions.
#
# @author Matthew Rayner
# @since 0.1
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_resource

  before_filter :cv, :fitbit

  protected

  def layout_by_resource
    if devise_controller?
      'admin_signin'
    else
      'application'
    end
  end

  def not_found
    fail ActionController::RoutingError.new('Not Found'), 'Not Found'
  end

  def cv
    @cv_url = cv_url
  end

  def cv_url
    cv = CurriculumVitae.last
    cv.file.url unless cv.nil?
  end

  def fitbit
    @fitbit_stats = FitBitStats.last
  end
end
