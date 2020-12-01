class UserStaticPagesController < ApplicationController

  protect_from_forgery with: :null_session
  
  def loginPageVal
    uname = User.find_by(email: params[:login][:email].downcase)
    admin = Admin.find_by(a_email: params[:login][:email].downcase)

      if uname && uname.password == params[:login][:psw]
        redirect_to projects_url
      elsif admin && admin.a_password == params[:login][:psw]
          redirect_to projects_url
      else
        flash.now[:danger] = 'Invalid email/password combination' 
        render 'loginPage'
      end
      
  end
  
  def loginPage
  end

  def projectPage
    @user_projects = Project.all
  end

  def groupPage
    @user_groups = Group.all
    @selected_project = Project.find(params[:selected_project])
  end

  def ratingPage
    @selected_user = User.find(params[:selected_user])
  end

end
