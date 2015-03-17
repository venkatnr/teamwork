class AddProjectDateToProjectDetails < ActiveRecord::Migration
  def change
    add_column :project_details, :project_date, :datetime
  end
end
