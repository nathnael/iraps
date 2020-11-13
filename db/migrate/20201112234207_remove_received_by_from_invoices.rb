class RemoveReceivedByFromInvoices < ActiveRecord::Migration[5.0]
  def change
    remove_column :invoices, :received_by, :integer
  end
end
