class AdminStaticPagesController < ApplicationController

  protect_from_forgery with: :null_session

  def projectPage
    @admin_projects = Project.all
  end

  def groupPage
    @admin_groups = Group.all
    @selected_project = Project.find(params[:selected_project])
  end

  def groupMemberPage
    @selected_group = Group.find(params[:selected_group])
  end

  # def studentPage
  # end

  def createNew
  end

  def ratingPage
    @selected_user = User.find(params[:selected_user])
    @user_projects = @selected_user.projects.all
  end

  def createProjectPage
  end

  def valAddProject
    puts params[:project].inspect
    @project = Project.new(project_parms);
    
      if @project.save
        redirect_to '/admin_static_pages/projectPage.html'
      else
        render 'new'
      end
  end

  private def project_parms
      params.require(:project).permit(:p_name, :project_type, :due_date)
  end
end
