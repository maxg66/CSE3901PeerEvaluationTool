class AdminsController < ApplicationController
  protect_from_forgery with: :null_session

  # For a page to list all admins (GET)
  # Named route: admins_path
  def index
    @admins = Admin.all
  end

  # For a page to show admin (GET)
  # Named route: admin_path(admin)
  def show
    @admin = Admin.find(params[:id])
    @admins = Admin.all
  end

  # For a page to make a new admin (GET)
  # Named route: new_admin_path
  def new
    @admin = Admin.new
  end

  # To create a new admin (POST)
  # Named route: admins_path
  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # For a page to edit admin with specific id number (GET)
  # Named route: edit_admin_path(admin)
  def edit
  end

  # To update a admin (PATCH)
  # Named route: admin_path(admin)
  def patch
  end

  # To delete a admin (DELETE)
  # Named route: admin_path(admin)
  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Only allow a list of trusted parameters through
  private def admin_params
    params.require(:admin).permit(:a_name, :a_email, :a_password)
  end
end
