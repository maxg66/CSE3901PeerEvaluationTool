class UsersController < ApplicationController
  protect_from_forgery with: :null_session

  # For a page to list all users (GET)
  # Named route: users_path
  def index
    @users = User.all
  end

  # For a page to show user (GET)
  # Named route: user_path(user)
  def show
    @user = User.find(params[:id])
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
