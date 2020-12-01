class UserStaticPagesController < ApplicationController

  protect_from_forgery with: :null_session
  
  def loginPageVal
    @specific_user = User.find_by(email: params[:login][:email].downcase)
    @admin = Admin.find_by(a_email: params[:login][:email].downcase)

    session = request.session_options[:id]
    if @specific_user && @specific_user.password == params[:login][:psw]
      redirect_to userSpecificProjects_path
      #session[:specific_user_id] = @specific_user.id
    elsif @admin && @admin.a_password == params[:login][:psw]
        redirect_to projects_url
    else
      flash.now[:danger] = 'Invalid login. Please try again.' 
      render 'loginPage'
    end    
  end

  # For a page to list all user specific projects (GET)
  # Named route: userSpecificProjects_path
  def userSpecificProjects
    @specific_user = User.find_by_id(session[:specific_user_id])
    @specific_user_groups = @specific_user.groups
    @specific_user_projects = []

    @specific_user_groups.find_each(:batch_size => 5000) do |group|
      group.projects.find_each(:batch_size => 5000) do |project|
        @specific_user_projects << project
      end
    end
  end

  def userProjectTeam
    @specific_project = Project.find(params[:specific_project])
    @specific_user = User.find_by_id(session[:specific_user_id])
    @specific_
    @specific_project.groups.find_each(:batch_size => 5000) do |group|

    end
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

end
