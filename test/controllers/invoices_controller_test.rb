require 'test_helper'

class InvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice = invoices(:one)
  end

  test "should get index" do
    get invoices_url
    assert_response :success
  end

  test "should get new" do
    get new_invoice_url
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post invoices_url, params: { invoice: { amount: @invoice.amount, currency_type: @invoice.currency_type, deleted_at: @invoice.deleted_at, invoice_date: @invoice.invoice_date, invoice_number: @invoice.invoice_number, lti_number: @invoice.lti_number, received_by: @invoice.received_by, received_date: @invoice.received_date, received_from: @invoice.received_from, remark: @invoice.remark, submitted_by: @invoice.submitted_by, vendor_id: @invoice.vendor_id, waybill_number: @invoice.waybill_number } }
    end

    assert_redirected_to invoice_url(Invoice.last)
  end

  test "should show invoice" do
    get invoice_url(@invoice)
    assert_response :success
  end

  test "should get edit" do
    get edit_invoice_url(@invoice)
    assert_response :success
  end

  test "should update invoice" do
    patch invoice_url(@invoice), params: { invoice: { amount: @invoice.amount, currency_type: @invoice.currency_type, deleted_at: @invoice.deleted_at, invoice_date: @invoice.invoice_date, invoice_number: @invoice.invoice_number, lti_number: @invoice.lti_number, received_by: @invoice.received_by, received_date: @invoice.received_date, received_from: @invoice.received_from, remark: @invoice.remark, submitted_by: @invoice.submitted_by, vendor_id: @invoice.vendor_id, waybill_number: @invoice.waybill_number } }
    assert_redirected_to invoice_url(@invoice)
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete invoice_url(@invoice)
    end

    assert_redirected_to invoices_url
  end
end
