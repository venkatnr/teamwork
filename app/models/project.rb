class Project < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :project_details

	def get_project_members
		self.users
	end

	def self.add_timmings_to_users(params, user)
		total_val = []
		if params["form_values"].present?
			params["form_values"].values.each do |data|
  				total_val << data[:value] 
 			end
 			data = total_val.each_slice(total_val.count/2).to_a
 			data.each do |individual_record|
 				ProjectDetail.create(:user_id => user.id, :project_id => params[:project_id], :description =>individual_record[0], :hours => individual_record[1], :project_date => DateTime.parse(params["date"]) )
 			end
		end
	end
end