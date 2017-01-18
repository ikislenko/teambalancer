class AddAllowNullForUserIdInTasks < ActiveRecord::Migration[5.0]
  def change
    change_column_null :tasks, :user_id, true
  end
end
