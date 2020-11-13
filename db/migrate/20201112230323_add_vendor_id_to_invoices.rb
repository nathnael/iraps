class AddVendorIdToInvoices < ActiveRecord::Migration[5.0]
  def change
    add_column :invoices, :vendor_id, :integer
  end
end
