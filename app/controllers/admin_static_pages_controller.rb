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

  def valAddUser
    puts params[:user].inspect
    @user = User.new(user_params);
    
      if @user.save
        redirect_to '/admin_static_pages/projectPage.html'
      else
        render 'new'
      end
  end

  private def user_params
      params.require(:user).permit(:u_name, :e_mail, :pass_word, :account_type)
  end


  def valAddGroup
    puts params[:group].inspect
    @group = Group.new(group_parms);
    
      if @group.save
        redirect_to '/admin_static_pages/projectPage.html'
      else
        render 'new'
      end
  end

  private def group_parms
      params.require(:group).permit(:g_name)
  end

  def valAddUsertoGroup
    puts params[:user2group].inspect
    @user2group = Group.new(user2group_parms);
    
      if @user2group.save
        redirect_to '/admin_static_pages/projectPage.html'
      else
        render 'new'
      end
  end

  private def group_parms
      params.require(:group).permit(:u_name, :g_name)
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
