class UsersController < ApplicationController
  protect_from_forgery with: :null_session

  # For a page to list all users (GET)
  # Named route: users_path
  def index
    @users = User.all
  end

  # For a page to list all users in specfic group (GET)
  # Named route: usersInGroup_path
  def usersInGroup
    @users = User.all
    @selected_group = Group.find(params[:selected_group])
    session[:current_group_id] = @selected_group.id
  end

  # For a page to view potential new users to a specific group (GET)
  # Named route: findAvailableUsers_path
  def findAvailableUsers
    @current_group = Group.find_by_id(session[:current_group_id])
    @possible_users = []

    # Check if user is included in current group
    User.find_each(:batch_size => 5000) do |pos_user|
      catch :pos_user_cannot_be_added do
        if (!@current_group.users.include?(pos_user))

          # Checks if user is already added to another group that exists in the current group's projects
          # (Users should only be added to one group in a single project)
          # --> Possible user is not added to the possible user array if this is the case
          @current_group.projects.find_each(:batch_size => 5000) do |project|
            project.groups.find_each(:batch_size => 5000) do |group|
              if (group.users.include?(pos_user))
                throw :pos_user_cannot_be_added
              end
            end
          end
          @possible_users << pos_user
        end
      end
    end
  end

  # To add an existing user to a specific group (POST)
  # Named route: addGroupToProject_path
  def addUserToGroup
    @user_to_add = User.find(params[:user_to_add])
    @current_group = Group.find_by_id(session[:current_group_id])
    @user_to_add.groups << @current_group
    redirect_to findAvailableUsers_url, notice: 'User was successfully added.'
  end

  # For a page to show user (GET)
  # Named route: user_path(user)
  def show
    @user = User.find(params[:id])
    @users = User.all
  end

  # For a page to make a new user (GET)
  # Named route: new_user_path
  def new
    @user = User.new   # new method is now accessible in new view
  end

  # To create a new user (POST)
  # Named route: users_path
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # For a page to edit user with specific id number (GET)
  # Named route: edit_user_path(user)
  def edit
  end

  # To update a user (PATCH)
  # Named route: user_path(user)
  def patch
  end

  # To delete a user (DELETE)
  # Named route: user_path(user)
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Only allow a list of trusted parameters through
  private def user_params
    params.require(:user).permit(:u_name, :email, :password)
  end

end
