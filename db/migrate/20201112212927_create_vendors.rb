class CreateVendors < ActiveRecord::Migration[5.0]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :code
      t.string :org_unit
      t.string :status

      t.timestamps
    end
  end
end
