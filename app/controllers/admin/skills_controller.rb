class Admin::SkillsController < Admin::BaseController
  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find_by(id: params[:id])
    not_found if @skill.nil?
  end

  def new
    @skill = Skill.new
  end

  def create
    if(@skill = Skill.create(skill_params)) && @skill.valid?
      return redirect_to admin_skill_path(@skill)
    end

    render 'admin/skills/new'
  end

  def edit
    @skill = Skill.find_by(id: params[:id])
    not_found if @skill.nil?
  end

  def update
    @skill = Skill.find_by id: params[:id]
    not_found if @skill.nil?

    @skill.update(skill_params)

    if @skill.valid?
      return redirect_to admin_skill_path(@skill), notice: 'Skill successfully updated!'
    end

    render 'admin/skills/edit'
  end

  def destroy
    @skill = Skill.find_by id: params[:id]
    not_found if @skill.nil?

    @skill.destroy

    if @skill.frozen?
      redirect_to admin_skills_path, notice: 'Skill successfully deleted!'
    else
      redirect_to admin_skills_path, alert: 'Error when deleting skill...'
    end
  end

  private

  def skill_params
    params.require(:skill).permit(:title, :level, {:case_study_ids => []})
  end
end
