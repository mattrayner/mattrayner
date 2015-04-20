# Allow the user to see a homepage.
#
# @author Matthew Rayner
# @since 0.1
class HomeController < ApplicationController
  def index
    @cv_url = cv_url
  end

  private

  def cv_url
    cv = CurriculumVitae.last
    cv.file.url unless cv.nil?
  end
end
