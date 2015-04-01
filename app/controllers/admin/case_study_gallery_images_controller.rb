class Admin::CaseStudyGalleryImagesController < Admin::BaseController
  def edit
    @case_study_gallery_image = CaseStudyGalleryImage.find_by(id: params[:id])
    not_found if @case_study_gallery_image.nil?
  end

  def update
    @case_study_gallery_image = CaseStudyGalleryImage.find_by(id: params[:id])
    not_found if @case_study_gallery_image.nil?

    if @case_study_gallery_image.update(case_study_gallery_image_params)
      redirect_to edit_admin_case_study_gallery_image_path(@case_study_gallery_image), notice: 'Gallery image was successfully updated.'
    else
      redirect_to edit_admin_case_study_gallery_image_path(@case_study_gallery_image), alert: 'An error occurred updating this image.'
    end
  end

  private

  def case_study_gallery_image_params
    params.require(:case_study_gallery_image).permit(:title, :image, :remove_image)
  end
end