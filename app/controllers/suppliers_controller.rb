class SuppliersController < ApplicationController
  before_action :require_signed_in?
  before_action :set_required_data, except: [:index, :destroy]
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]


  def index
    @suppliers = current_company.suppliers.all
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      redirect_to suppliers_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @supplier.update(supplier_params)
      redirect_to suppliers_path
    else
      render :new
    end
  end

  def destroy
    @supplier.delete
    redirect_to suppliers_path
  end

  private

    def set_required_data
      @currencies = Currency.active_currencies
      @warehouses = current_company.warehouses.where(active: true)
      @payment_terms = current_company.payment_terms.where(active: true)
    end

    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    def supplier_params
      params.require(:supplier).permit(
        :company_id,
        :name,
        :currency_id,
        :payment_term_id,
        :warehouse_id,
        :tax_id_number,        
        :comment,
        :active)
    end

end