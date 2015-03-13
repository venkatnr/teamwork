class MydetailsController < ApplicationController
  before_filter :authenticate_user!
  def index
  		if current_user.is_admin?
			redirect_to dashboard_index_path
		else
			@projects = current_user.projects
			return true
		end
  end
end
