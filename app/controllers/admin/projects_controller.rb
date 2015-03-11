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
    if (@project = Project.create(user_params)) && @project.valid?
      return redirect_to admin_project_path(@project)
    end

    render 'admin/projects/edit'
  end

  def update
    @project = Project.find_by id: params[:id]
    not_found if @project.nil?

    @project.update(user_params)

    redirect_to admin_project_path(@project)
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

  def user_params
    params.require(:project).permit(:title, :intro, :body)
  end
end