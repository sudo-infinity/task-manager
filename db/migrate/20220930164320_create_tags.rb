class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      enable_extension 'citext'
      t.citext :name, null: false

      t.timestamps
    end
  end
end
