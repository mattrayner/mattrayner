class Admin::ProjectGalleryImagesController < Admin::BaseController
  def edit
    @project_gallery_image = ProjectGalleryImage.find_by(id: params[:id])
    not_found if @project_gallery_image.nil?
  end

  def update
    @project_gallery_image = ProjectGalleryImage.find_by(id: params[:id])
    not_found if @project_gallery_image.nil?

    if @project_gallery_image.update(project_gallery_image_params)
      redirect_to edit_admin_project_gallery_image_path(@project_gallery_image), notice: 'Gallery image was successfully updated.'
    else
      redirect_to edit_admin_project_gallery_image_path(@project_gallery_image), alert: 'An error occurred updating this image.'
    end
  end

  private

  def project_gallery_image_params
    params.require(:project_gallery_image).permit(:title, :image, :remove_image)
  end
end