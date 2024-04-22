class AddUniqueIndexToTasTags < ActiveRecord::Migration[7.0]
  def change
    add_index :task_tags, [:tag_id, :task_id], unique: true
  end
end
