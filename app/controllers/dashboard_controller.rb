class DashboardController < ApplicationController
	before_filter :authenticate_user!
	layout "admin_layout"

	def index
  		if current_user.is_admin?
  			@project = Project.new
  			@projects = Project.all
			return true
		else
			redirect_to mydashboard_index_path
		end
	end
end
