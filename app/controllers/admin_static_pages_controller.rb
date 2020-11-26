class AdminStaticPagesController < ApplicationController
  def loginPage
  end

  def projectPage
  end

  def groupPage
    @users_groups = Group.all
  end

  def groupMemberPage
  end

  def studentPage
  end

  def ratingPage
  end
  
end
