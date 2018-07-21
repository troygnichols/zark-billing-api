require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get :index, as: :json
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, as: :json, params: { item: { invoice_id: @item.invoice_id, description: @item.description, item_type: @item.item_type, quantity: @item.quantity, unit_price: @item.unit_price } }
    end

    assert_response :created
  end

  test "should show item" do
    get :show, as: :json, params: {id: @item}
    assert_response :success
  end

  test "should update item" do
    patch :update, as: :json, params: {id: @item, item: { description: @item.description, item_type: @item.item_type, quantity: @item.quantity, unit_price: @item.unit_price }}
    assert_response :success
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, as: :json, params: {id: @item}
    end

    assert_response :no_content
  end
end
