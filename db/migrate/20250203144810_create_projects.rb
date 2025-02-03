class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.references :user, foreign_key: true, null: true, index: true
      t.string :title, null: false
      t.text :description
      t.integer :status, default: 0, null: false
      t.string :user_name, null: false
      t.timestamps
    end

    add_index :projects, :title, unique: true
  end
end
