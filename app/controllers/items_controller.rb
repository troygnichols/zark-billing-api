class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.joins(:invoice).where(
      invoices: {user_id: current_user.id}).all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    if @item.invoice.user_id = current_user.id
      if @item.save
        render :show, status: :created, location: @item
      else
        render json: @item.errors, status: :unprocessable_entity
      end
    else
      head :unauthorized
    end

  end

  def update
    if @item.update(item_params)
      render :show, status: :ok, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    head :no_content
  end

  private
    def set_item
      @item = Item.joins(:invoice).find_by(
        id: params[:id], invoices: {user_id: current_user.id})
      head :not_found unless @item
    end

    def item_params
      params.require(:item).permit(:invoice_id, :description, :quantity, :unit_price)
    end
end
