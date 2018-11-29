class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
  end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
    @items = Item.all

    return @purchase, @items
  end

  # GET /purchases/1/edit
  def edit
    @items = Item.all

    return @items
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @purchase = Purchase.new(purchase_params)
    d = DateTime.now

    @purchase.date = d.strftime("%d/%m/%Y %H:%M")
    @item = Item.find_by_id @purchase.item.id
    @item.storage += @purchase.amount
    @item.save

    @purchase.unit_price = @item.unit_price
    @purchase.total_price = (@item.unit_price * @purchase.amount).round(2)

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @purchase, notice: 'Purchase was successfully created.' }
        format.json { render :show, status: :created, location: @purchase }
      else
        format.html { render :new }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchases/1
  # PATCH/PUT /purchases/1.json
  def update
    @item = Item.find(@purchase.item_id)
    @item.storage -= @purchase.amount

    respond_to do |format|
      if @purchase.update(purchase_params)
        @item.storage += @purchase.amount
        @item.save
        format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit(:amount, :unit_price, :total_price, :date, :employee_id, :provider_id, :item_id)
    end
end
