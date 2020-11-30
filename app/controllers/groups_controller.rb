class GroupsController < ApplicationController
  # For a page to list all groups (GET)
  # Named route: groups_path
  def index
    @groups = Group.all
  end

  # For a page to show group (GET)
  # Named route: group_path(group)
  def show
    @groups = Group.find(params[:id])
  end

  # For a page to make a new group (GET)
  # Named route: new_group_path
  def new
    @groups = Group.new
  end

  # To create a new group (POST)
  # Named route: groups_path
  def create
    @groups = Group.new(group_params)

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
  end

  # To update a group (PATCH)
  # Named route: group_path(group)
  def patch
  end

  # To delete a group (DELETE)
  # Named route: group_path(group)
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Only allow a list of trusted parameters through
  private def group_params
    params.require(:group).permit(:g_name)
  end
end
