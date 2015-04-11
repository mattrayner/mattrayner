module Admin
  # Allow a user to view, create and edit case studies from within the admin
  # interface.
  #
  # @author Matthew Rayner
  # @since 0.1
  class CaseStudiesController < Admin::BaseController
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
      @case_study = CaseStudy.find_by id: params[:id]

      not_found if @case_study.nil?
    end

    def create
      @case_study = CaseStudy.create(case_study_params)

      create_gallery_images if @case_study && valid_case_study?

      if valid_case_study?
        redirect_to admin_case_study_path(@case_study)
      else
        render 'admin/case_studies/new'
      end
    end

    def update
      @case_study = CaseStudy.find_by id: params[:id]
      not_found if @case_study.nil?

      @case_study.update(case_study_params)

      if valid_case_study?
        update_gallery_images

        create_gallery_images

        redirect_to admin_case_study_path(@case_study), notice: t('.success')
      else
        render 'admin/case_studies/edit'
      end
    end

    def destroy
      @case_study = CaseStudy.find_by id: params[:id]
      not_found if @case_study.nil?

      @case_study.destroy

      if @case_study.frozen?
        redirect_to admin_case_studies_path, notice: t('.success')
      else
        redirect_to admin_case_studies_path, alert: t('.error')
      end
    end

    private

    def case_study_params
      params.require(:case_study).permit(:title, :intro, :body, :header_image,
                                         :remove_header_image,
                                         skill_ids: [],
                                         gallery_images_attributes:
                                           [:id,
                                            :case_study_id, :image,
                                            :remove_image])
    end

    def create_gallery_images
      fetch_gallery_images.each do |image|
        @case_study.gallery_images.create!(image: image,
                                           case_study_id: @case_study.id)
      end
    end

    def update_gallery_images
      fetch_gallery_image_attributes.each do |image|
        image = image[1]

        if image[:remove_image] == '1'
          @gallery_image = CaseStudyGalleryImage.find_by(id: image[:id])
          @gallery_image.destroy unless @gallery_image.nil?
        end
      end
    end

    def valid_case_study?
      @case_study.valid?
    end

    def fetch_gallery_images
      params.fetch(:case_study_gallery_images, {}).fetch(:images, [])
    end

    def fetch_gallery_image_attributes
      params.fetch(:case_study, {}).fetch(:gallery_images_attributes, [])
    end
  end
end
