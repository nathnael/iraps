json.extract! invoice, :id, :vendor_id, :received_date, :received_from, :invoice_number, :invoice_date, :currency_type, :amount, :waybill_number, :lti_number, :remark, :received_by, :submitted_by, :deleted_at, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
