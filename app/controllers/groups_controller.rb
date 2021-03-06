class GroupsController < ApplicationController
  protect_from_forgery with: :null_session

  # For a page to list all groups (GET)
  # Named route: groups_path
  def index
    @groups = Group.all
  end

  # For a page to list all groups in specfic project (GET)
  # Named route: groupsInProject_path
  def groupsInProject
    @groups = Group.all
    @selected_project = Project.find(params[:selected_project])
    session[:current_project_id] = @selected_project.id
  end

  # For a page to view groups that have not yet been added to a specific project (GET)
  # Named route: findAvailableGroups_path
  def findAvailableGroups
    @current_project = Project.find_by_id(session[:current_project_id])
    @possible_groups = []
    Group.find_each(:batch_size => 5000) do |group|
      if (!@current_project.groups.include?(group))
        @possible_groups << group
      end
    end
  end

  # To add an existing group to a specific project (POST)
  # Named route: addGroupToProject_path
  def addGroupToProject
    @group_to_add = Group.find(params[:group_to_add])
    @current_project = Project.find_by_id(session[:current_project_id])
    @group_to_add.projects << @current_project
    redirect_to findAvailableGroups_url, notice: 'Group was successfully added.'
  end

  # For a page to show group (GET)
  # Named route: group_path(group)
  def show
    @group = Group.find(params[:id])
    @students = @group.users
  end

  # For a page to make a new group (GET)
  # Named route: new_group_path
  def new
    @group = Group.new
  end

  # To create a new group (POST)
  # Named route: groups_path
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # For a page to edit group with specific id number (GET)
  # Named route: edit_group_path(group)
  def edit
    @group = Group.find(params[:id])
  end

  # To update a group (PATCH)
  # Named route: group_path(group)
  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to @group, notice: 'Success!'
    else
      flash.now[:notice] = 'Try again.'
      render :edit
    end
  end

  # To delete a group (DELETE)
  # Named route: group_path(group)
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash.now[:success] = "Group was sucessfully deleted."
    redirect_to projects_url
  end

  # Only allow a list of trusted parameters through
  private def group_params
    params.require(:group).permit(:g_name)
  end
end
