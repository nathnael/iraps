class AddModifiedByToVendors < ActiveRecord::Migration[5.0]
  def change
    add_column :vendors, :modified_by, :integer
  end
end
