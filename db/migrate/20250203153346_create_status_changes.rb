class CreateStatusChanges < ActiveRecord::Migration[8.0]
  def change
    create_table :status_changes do |t|
      t.references :project, null: false, foreign_key: true, index: true
      t.references :user, null: true, foreign_key: true, index: true
      t.integer :new_status, null: false
      t.string :user_name, null: false
      t.timestamps
    end
  end
end
