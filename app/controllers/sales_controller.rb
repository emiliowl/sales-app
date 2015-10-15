class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    ActiveRecord::Base.transaction do
      params = sale_params
      @sale = Sale.build_from_sale_items(params['sale_items'])
      @sale.save!
    end

    respond_to do |format|
      if @sale.persisted?
        format.json { render :show, status: :created, location: @sale }
      else
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy!
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(sale_items: [:name, :origin_id, :value, :quantity])
    end
end
