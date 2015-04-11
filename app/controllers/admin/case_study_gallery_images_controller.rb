module Admin
  # Allow a user to edit and update case study gallery images from within the
  # admin interface.
  #
  # @author Matthew Rayner
  # @since 0.1
  class CaseStudyGalleryImagesController < Admin::BaseController
    def edit
      @case_study_gallery_image = CaseStudyGalleryImage.find_by(id: params[:id])
      not_found if @case_study_gallery_image.nil?
    end

    def update
      @case_study_gallery_image = CaseStudyGalleryImage.find_by(id: params[:id])
      not_found if @case_study_gallery_image.nil?

      path = edit_admin_case_study_gallery_image_path(@case_study_gallery_image)

      if @case_study_gallery_image.update(case_study_gallery_image_params)
        redirect_to path, notice: t('.success')
      else
        redirect_to path, alert: t('.error')
      end
    end

    private

    def case_study_gallery_image_params
      params.require(:case_study_gallery_image).permit(:title,
                                                       :image,
                                                       :remove_image)
    end
  end
end
