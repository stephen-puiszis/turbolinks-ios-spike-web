class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.integer :user_id, index: true, null: false
      t.string :title, null: false
      t.text :description
      t.timestamps
    end
  end
end
