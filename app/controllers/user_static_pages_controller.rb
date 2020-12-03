class UserStaticPagesController < ApplicationController

  protect_from_forgery with: :null_session
  
  def loginPageVal
    @specific_user = User.find_by(email: params[:login][:email].downcase)
    @admin = Admin.find_by(a_email: params[:login][:email].downcase)

    if @specific_user && @specific_user.password == params[:login][:psw]
      log_in @specific_user
      redirect_to userSpecificProjects_path
      session[:specific_user_id] = @specific_user.id
    elsif @admin && @admin.a_password == params[:login][:psw]
        redirect_to projects_url
    else
      flash.now[:danger] = 'Invalid login. Please try again.' 
      render 'loginPage'
    end    
  end

  # For a page to list all users (GET)
  # Named route: currentStudents_path
  def currentStudents
    @users = User.all
  end

  # For a page to list all user specific projects (GET)
  # Named route: userSpecificProjects_path
  def userSpecificProjects
    #@specific_user = User.find(6) #TEMPORARY: REMOVE LATER
    @specific_user = current_user
    @specific_user_groups = @specific_user.groups
    @specific_user_projects = []

    @specific_user_groups.find_each(:batch_size => 5000) do |group|
      group.projects.find_each(:batch_size => 5000) do |project|
        @specific_user_projects << project
      end
    end
  end

  def userProjectTeam
    #byebug
    @specific_project = Project.find(params[:specific_project])
    #@specific_user = User.find(6) #TEMPORARY: REMOVE LATER
    @specific_user = User.find_by_id(session[:specific_user_id])
    @specific_group_members = []
    @specific_group = nil
    @specific_project.groups.find_each(:batch_size => 5000) do |group|
      if(group.users.include?(@specific_user)) 
        @specific_group = group
        group.users.each do |member| 
          @specific_group_members << member
        end
      end
    end
  end

  def ratingPage
    @selected_user = User.find_by_id(params[:specific_user])
  end

  def addEval

  end

  # def usersInGroup
  #   @users = User.all
  #   @selected_group = Group.find(params[:selected_group])
  #   session[:specific_group_id] = @selected_group.id
  # end

  # # For a page to view potential new users to a specific group (GET)
  # # Named route: findAvailableUsers_path
  # def findAvailableUsers
  #   @specific_group = Group.find_by_id(session[:specific_group_id])
  #   @possible_users = []
  
  # def loginPage
  # end

  # def projectPage
  #   @user_projects = Project.all
  # end

  # def groupPage
  #   @user_groups = Group.all
  #   @selected_project = Project.find(params[:selected_project])
  # end

  # def ratingPage
  #   @selected_user = User.find(params[:selected_user])
  # end

  # private def user_params
  #   params.require(:user).permit(:email, :password)
  # end

  # private def admin_params
  #   params.require(:admin).permit(:a_email, :a_password)
  # end

end
