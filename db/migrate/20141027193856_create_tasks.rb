class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :list_id
      t.references :list, index: true
      t.integer :user_id
      t.references :user, index: true

      t.timestamps
    end
  end
end
