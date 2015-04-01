class TimesheetController < ApplicationController
  before_filter :authenticate_user!
  layout "user_layout"

  def user_timesheet
  		if current_user.is_admin?
			redirect_to dashboard_index_path
		else
			@projects = current_user.projects
			return true
		end
  end

  def create_time_sheet
  	raise "test".inspect
  end
end
