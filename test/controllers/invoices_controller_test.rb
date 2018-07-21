require 'test_helper'

class InvoicesControllerTest < ActionController::TestCase
  setup do
    @invoice = invoices(:one)
  end

  test "should get index" do
    get :index, as: :json
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post :create, as: :json, params: { invoice: { client_name: @invoice.client_name, due_date: @invoice.due_date, entity_name: @invoice.entity_name, invoice_id: @invoice.invoice_id, issue_date: @invoice.issue_date, subject: @invoice.subject } }
    end
    assert_response :created
  end

  test "should show invoice" do
    get :show, as: :json, params: {id: @invoice}
    assert_response :success
  end

  test "should update invoice" do
    patch :update, as: :json, params: {id: @invoice, invoice: { client_name: @invoice.client_name, due_date: @invoice.due_date, entity_name: @invoice.entity_name, invoice_id: @invoice.invoice_id, issue_date: @invoice.issue_date, subject: @invoice.subject }}
    assert_response :success
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete :destroy, params: {id: @invoice}
    end

    assert_redirected_to invoices_path
  end
end
