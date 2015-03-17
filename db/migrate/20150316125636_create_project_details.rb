class CreateProjectDetails < ActiveRecord::Migration
  def change
    create_table :project_details do |t|
      t.integer :project_id
      t.integer :user_id
      t.text :description
      t.integer :hours

      t.timestamps
    end
  end
end
