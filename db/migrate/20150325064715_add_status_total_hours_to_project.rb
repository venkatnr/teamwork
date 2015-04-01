class AddStatusTotalHoursToProject < ActiveRecord::Migration
  def change
    add_column :projects, :status, :boolean
    add_column :projects, :total_hours, :integer
  end
end
