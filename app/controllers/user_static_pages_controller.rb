class UserStaticPagesController < ApplicationController
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
