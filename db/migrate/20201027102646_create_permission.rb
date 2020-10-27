class CreatePermission < ActiveRecord::Migration[5.0]
  def change
    create_table :permissions do |t|
      t.string :name
      t.string :description
      t.integer :created_by
      t.integer :modified_by
      t.datetime :created_at

      t.timestamps
    end
  end
end
