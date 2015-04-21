# Allow the user to see case studies.
#
# @author Matthew Rayner
# @since 0.2
class CaseStudiesController < ApplicationController
  def index
    @case_studies = CaseStudy.all
  end
end
