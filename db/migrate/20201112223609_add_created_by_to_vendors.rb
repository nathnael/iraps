class AddCreatedByToVendors < ActiveRecord::Migration[5.0]
  def change
    add_column :vendors, :created_by, :integer
  end
end
