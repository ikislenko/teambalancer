class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.integer :story_points
      t.references :user
      
      t.timestamps
    end
  end
end
