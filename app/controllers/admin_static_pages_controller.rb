class AdminStaticPagesController < ApplicationController

  protect_from_forgery with: :null_session
#&& uname.authenticate(params[:login][:psw])
  def loginPage2
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
        #redirect_back(fallback_location: root_path)
      end
      
  end

  def loginPage
  end

  def projectPage
    @admin_projects = Project.all
  end

  def groupPage
    @admin_groups = Group.all
  end

  def groupMemberPage
  end

  def studentPage
  end

  def ratingPage
  end

  private 
    def login_parms
        params.require(:login).permit(:uname, :psw)
    end
  
end
