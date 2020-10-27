class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.integer :created_by
      t.integer :modified_by
      t.string :resource_type
      t.integer :resource_id
      t.datetime :created_at

      t.timestamps
    end
  end
end
