class Admin::CurriculumVitaesController < Admin::BaseController
  # Sort all of the CVs by the last time they were updated
  def index
    @curriculum_vitaes = CurriculumVitae.all.sort_by(&:updated_at).reverse!
  end

  def show
    @curriculum_vitae = CurriculumVitae.find_by(id: params[:id])
    not_found if @curriculum_vitae.nil?
  end

  def new
    @curriculum_vitae = CurriculumVitae.new
  end

  def create
    if (@curriculum_vitae = CurriculumVitae.create(curriculum_vitae_params)) && @curriculum_vitae.valid?
      return redirect_to admin_curriculum_vitae_path(@curriculum_vitae)
    end

    render 'admin/curriculum_vitaes/new'
  end

  def edit
    @curriculum_vitae = CurriculumVitae.find_by(id: params[:id])
    not_found if @curriculum_vitae.nil?
  end

  def update
    @curriculum_vitae = CurriculumVitae.find_by(id: params[:id])
    not_found if @curriculum_vitae.nil?

    if @curriculum_vitae.update(curriculum_vitae_params)
      redirect_to edit_admin_curriculum_vitae_path(@curriculum_vitae), notice: 'CV was successfully updated.'
    else
      redirect_to edit_admin_curriculum_vitae_path(@curriculum_vitae), alert: 'An error occurred updating this CV.'
    end
  end

  def destroy
    @curriculum_vitae = CurriculumVitae.find_by(id: params[:id])
    not_found if @curriculum_vitae.nil?

    @curriculum_vitae.destroy

    if @curriculum_vitae.frozen?
      redirect_to admin_curriculum_vitaes_path, notice: 'CV successfully deleted!'
    else
      redirect_to admin_curriculum_vitaes_path, alert: 'Error deleting CV...'
    end
  end

  private

  def curriculum_vitae_params
    params.require(:curriculum_vitae).permit(:note, :file, :remove_file)
  end
end