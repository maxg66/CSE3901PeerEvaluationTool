class AdminStaticPagesController < ApplicationController

  def projectPage
    @admin_projects = Project.all
  end

  def groupPage
    @admin_groups = Group.all
  end

  def groupMemberPage
  end

  # def studentPage
  # end

  def ratingPage
  end

end
