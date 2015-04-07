class Admin::CaseStudiesController < Admin::BaseController
  def index
    @case_studies = CaseStudy.all
  end

  def new
    @case_study = CaseStudy.new
  end

  def edit
    @case_study = CaseStudy.find_by id: params[:id]

    not_found if @case_study.nil?
  end

  def show
    @case_study= CaseStudy.find_by id: params[:id]

    not_found if @case_study.nil?
  end

  def create
    if (@case_study = CaseStudy.create(case_study_params)) && @case_study.valid?
      create_gallery_images

      return redirect_to admin_case_study_path(@case_study) if @case_study.valid?
    end

    render 'admin/case_studies/new'
  end

  def update
    @case_study = CaseStudy.find_by id: params[:id]
    not_found if @case_study.nil?

    @case_study.update(case_study_params)

    if @case_study.valid?
      update_gallery_images

      create_gallery_images

      redirect_to admin_case_study_path(@case_study), notice: 'Case study successfully updated!'
    else
      render 'admin/case_studies/edit'
    end
  end

  def destroy
    @case_study = CaseStudy.find_by id: params[:id]
    not_found if @case_study.nil?

    @case_study.destroy

    if @case_study.frozen?
      redirect_to admin_case_studies_path, notice: 'Case study successfully deleted!'
    else
      redirect_to admin_case_studies_path, alert: 'Error when deleting case study...'
    end
  end

  private

  def case_study_params
      params.require(:case_study).permit(:title, :intro, :body, :header_image, :remove_header_image, {:skill_ids => []}, gallery_images_attributes: [:id, :case_study_id, :image, :remove_image])
  end

  def create_gallery_images
    params.fetch(:case_study_gallery_images, {}).fetch(:images, []).each do |image|
      @gallery_image = @case_study.gallery_images.create!(:image => image, :case_study_id => @case_study.id)
    end
  end

  def update_gallery_images
    params.fetch(:case_study, {}).fetch(:gallery_images_attributes, []).each do |image|
      image = image[1]

      if image[:remove_image] == '1'
        @gallery_image = CaseStudyGalleryImage.find_by(id: image[:id])
        @gallery_image.destroy unless @gallery_image.nil?
      end
    end
  end
end