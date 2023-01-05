class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
      
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  def my_create
    @order = Order.new(money: params[:money], isDelivered: false, isProcessed: false, buyer_id: current_user.id, seller_id: params[:seller_id])
    @order.save
    @cart=Cart.find_by(id: params[:cart_id])
    @seller=Seller.find_by(id: params[:seller_id])
    @cart_items=OrderItem.where(cart_id: @cart.id)
    @cart_items.each do |cart_item|
      @tmp_item=Item.find_by(id: cart_item.item_id)
      @tmp_item.sales += cart_item.count
      @tmp_item.save
      cart_item.order_id = @order.id
      cart_item.cart = nil
      cart_item.save
    end
    @cart.delete
    redirect_to @seller 
  end
  # GET /orders/new
  def new
  
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:time, :money, :isProcessed, :isDelivered, :seller_id, :buyer_id)
    end
end
