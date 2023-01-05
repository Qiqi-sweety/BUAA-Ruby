class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show edit update destroy ]

  # GET /carts or /carts.json
  def index
    @item = Item.find_by(id: params[:item_id])
    @buyer=Buyer.find_by(user_id:current_user.id)
    @seller = Seller.find_by(id: params[:seller_id])
    if Cart.find_by(seller_id: params[:seller_id], buyer_id: @buyer.id)
      @cart=Cart.find_by(seller_id: params[:seller_id], buyer_id: @buyer.id)
    else
      @cart=Cart.new(seller_id: params[:seller_id], buyer_id: @buyer.id)
      @cart.save
    end
    @order_item=OrderItem.find_by(cart_id: @cart.id)
    if OrderItem.find_by(cart_id: @cart.id, item_id: params[:item_id])
      @order_item=OrderItem.find_by(cart_id: @cart.id)
      @order_item.count += 1
      @order_item.money += @item.price
    else
      @order_item=OrderItem.new(item_id: params[:item_id], cart_id: @cart.id, count: 1, cart_id: @cart.id, money: @item.price)
    end
    @order_item.save
    redirect_to @seller
  end

  
  # GET /carts/1 or /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully created." }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy

    respond_to do |format|
      format.html { redirect_to carts_url, notice: "Cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:buyer_id, :seller_id, :item_id, :cart_id)
    end
end
