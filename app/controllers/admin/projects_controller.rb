class Admin::ProjectsController < Admin::BaseController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find_by id: params[:id]

    not_found if @project.nil?
  end

  def show
    @project = Project.find_by id: params[:id]

    not_found if @project.nil?
  end

  def create
    if (@project = Project.create(project_params)) && @project.valid?
      create_gallery_images

      return redirect_to admin_project_path(@project) if @project.valid?
    end

    render 'admin/projects/new'
  end

  def update
    @project = Project.find_by id: params[:id]
    not_found if @project.nil?

    @project.update(project_params)

    if @project.valid?
      update_gallery_images

      create_gallery_images

      redirect_to admin_project_path(@project), notice: 'Project successfully updated!'
    else
      render 'admin/projects/edit'
    end
  end

  def destroy
    @project = Project.find_by id: params[:id]
    not_found if @project.nil?

    @project.destroy

    if @project.frozen?
      return redirect_to admin_projects_path, notice: 'Project successfully deleted!'
    else
      return redirect_to admin_projects_path, alert: 'Error when deleting project...'
    end
  end

  private

  def project_params
      params.require(:project).permit(:title, :intro, :body, :header_image, :remove_header_image, gallery_images_attributes: [:id, :project_id, :image, :remove_image])
  end

  def create_gallery_images
    params.fetch(:project_gallery_images, {}).fetch(:images, []).each do |image|
      @gallery_image = @project.gallery_images.create!(:image => image, :project_id => @project.id)
    end
  end

  def update_gallery_images
    params.fetch(:project, {}).fetch(:gallery_images_attributes, []).each do |image|
      image = image[1]

      if image[:remove_image] == '1'
        @gallery_image = ProjectGalleryImage.find_by(id: image[:id])
        @gallery_image.destroy unless @gallery_image.nil?
      end
    end
  end
end