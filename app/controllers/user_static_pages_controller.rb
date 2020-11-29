class UserStaticPagesController < ApplicationController

  protect_from_forgery with: :null_session
#&& uname.authenticate(params[:login][:psw])
  def loginPageVal
    uname = User.find_by(email: params[:login][:email].downcase)

      if uname && uname.password == params[:login][:psw]
        if uname.account_type == "admin"
          redirect_to '/admin_static_pages/projectPage.html'
        else
          redirect_to '/user_static_pages/groupPage.html'
        end
      else
        flash.now[:danger] = 'Invalid email/password combination' 
        render 'loginPage'
        #redirect_back(fallback_location: rSoot_path)
      end
      
  end
  
  def loginPage
  end

  def projectPage
    @user_projects = Project.all
  end

  def groupPage
    @user_groups = Group.all
  end

  def ratingPage
  end

end
