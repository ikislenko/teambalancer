class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :story_points
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
