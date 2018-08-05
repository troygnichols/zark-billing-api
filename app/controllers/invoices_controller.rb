class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  def index
    @invoices = Invoice.order('invoice_id asc')
      .where(user_id: current_user.id).all
  end

  def show
  end

  def create
    @invoice = Invoice.new(invoice_params.merge(user_id: current_user.id))

    if @invoice.save
      render :show, status: :created, location: @invoice
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  def update
    if @invoice.update(invoice_params)
      render :show, status: :ok, location: @invoice
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @invoice.destroy
    head :no_content
  end

  private
    def set_invoice
      @invoice = Invoice.find_by(id: params[:id], user_id: current_user.id)
      head :not_found unless @invoice
    end

    def invoice_params
      params.require(:invoice).permit(:entity_name, :entity_address, :client_name, :invoice_id, :issue_date, :due_date, :subject, :notes, :paid_date,
                                      items_attributes: [:id, :item_type, :description, :quantity, :unit_price, :_destroy])
    end
end
