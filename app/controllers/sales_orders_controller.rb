class SalesOrdersController < ApplicationController
  before_action :require_signed_in?
  before_action :set_sales_order, only: [:show, :edit, :update, :destroy]
  
  def index
    @sales_orders = current_company.sales_orders.all
  end

  def new
    @sales_order = SalesOrder.new
  end

  def create
    @sales_order = SalesOrder.new(sales_order_params)
    if @sales_order.save
      redirect_to sales_orders_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @sales_order.update(sales_order_params)
      redirect_to sales_orders_path
    else
      render :new
    end
  end

  def destroy
    @sales_order.delete
    redirect_to sales_orders_path
  end

  private

    def set_sales_order
      @sales_order = SalesOrder.find(params[:id])
    end

    def sales_order_params
      params.require(:sales_order).permit(
        :company_address_id,
        :warehouse_id,
        :account_id,
        :account_address_id,
        :reference,
        :comment,
        :order_status_id)
    end

end
