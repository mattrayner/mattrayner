# Allow the user to see case studies.
#
# @author Matthew Rayner
# @since 0.2
class CaseStudiesController < ApplicationController
  def index
    @case_studies = CaseStudy.all
  end

  def show
    @case_study = CaseStudy.find_by(id: params[:id])
    not_found if @case_study.nil?
  end
end
