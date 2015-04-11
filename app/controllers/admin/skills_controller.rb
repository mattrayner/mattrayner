module Admin
  # Allow a user to view, create and edit skills from within the admin
  # interface.
  #
  # @author Matthew Rayner
  # @since 0.1
  class SkillsController < Admin::BaseController
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
      if (@skill = Skill.create(skill_params)) && @skill.valid?
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
        return redirect_to admin_skill_path(@skill), notice: t('.success')
      end

      render 'admin/skills/edit'
    end

    def destroy
      @skill = Skill.find_by id: params[:id]
      not_found if @skill.nil?

      @skill.destroy

      if @skill.frozen?
        redirect_to admin_skills_path, notice: t('.success')
      else
        redirect_to admin_skills_path, alert: t('.error')
      end
    end

    private

    def skill_params
      params.require(:skill).permit(:title, :level, case_study_ids: [])
    end
  end
end
