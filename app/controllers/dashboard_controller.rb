class DashboardController < ApplicationController
	before_filter :authenticate_user!

	def index
  		if current_user.is_admin?
			return true
		else
			redirect_to mydetails_index_path
		end
	end
end
