class Invoice < ApplicationRecord
    belongs_to :vendor, foreign_key: 'vendor_id'
    belongs_to :user, foreign_key: 'created_by'

    enum currency_type: {
        etb: 1,
        usd: 2
    }

    enum received_from: {
        Transporter: 1,
        'Sub-office': 2,
        Others: 3
    }

    def vendor
        Vendor.find_by(id: self.vendor_id)
    end
end
