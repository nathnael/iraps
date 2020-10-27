class AddDeletedAtToRemainingModels < ActiveRecord::Migration[5.0]
  def change
    [ :roles, 
      :permissions, 
      :users_permissions, 
      :users_departments, 
      :department_permissions, 
      :departments, 
      :users_roles
    ].each do |table|
      add_column table, :deleted_at, :datetime
      add_index table, :deleted_at
    end
  end
end
