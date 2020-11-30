class ProjectsController < ApplicationController
  # For a page to list all projects (GET)
  # Named route: projects_path
  def index
    @projects = Project.all
  end

  # For a page to show project (GET)
  # Named route: project_path(project)
  def show
    @projects = Project.find(params[:id])
  end

  # For a page to make a new project (GET)
  # Named route: new_project_path
  def new
    @projects = Project.new
  end

  # To create a new project (POST)
  # Named route: projects_path
  def create
    @projects = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # For a page to edit project with specific id number (GET)
  # Named route: edit_project_path(project)
  def edit
  end

  # To update a project (PATCH)
  # Named route: project_path(project)
  def patch
  end

  # To delete a project (DELETE)
  # Named route: project_path(project)
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Only allow a list of trusted parameters through
  private def project_params
    params.require(:project).permit(:p_name, :project_type, :due_date)
  end
end