class CreateUsersPermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :users_permissions do |t|
      t.integer :user_id
      t.integer :permission_id
      t.integer :created_by
      t.integer :modified_by
      t.datetime :created_at

      t.timestamps
    end
  end
end
