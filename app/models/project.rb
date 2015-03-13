class Project < ActiveRecord::Base
	has_and_belongs_to_many :users

	def get_project_members
		self.users
	end
end
