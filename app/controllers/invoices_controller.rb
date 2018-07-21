class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.order('invoice_id asc').all
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      render :show, status: :created, location: @invoice
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    if @invoice.update(invoice_params)
      render :show, status: :ok, location: @invoice
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:entity_name, :entity_address, :client_name, :invoice_id, :issue_date, :due_date, :subject, :notes, :paid_date,
                                      items_attributes: [:id, :item_type, :description, :quantity, :unit_price, :_destroy])
    end
end
