class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:new,:create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:index, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @categories = Category.all
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @categories = Category.all
  end

  # GET /orders/new
  def new
    @categories = Category.all
    if @cart.line_items.empty?
      redirect_to store_url, notice: "Your Cart is empty"
      return
    end
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    @categories = Category.all
  end
  def my_orders
    @categories = Category.all
    @orders = Order.all
  end

  # POST /orders
  # POST /orders.json
  def create
    @categories = Category.all
    @order = Order.new(order_params)
    if logged_in?
      @order.user_id = current_user.id
    else
     @order.user_id = 0
   end
   @order.add_line_items_from_cart(@cart)
   respond_to do |format|
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      format.html { redirect_to store_url, notice: 'Order was successfully placed.' }
      format.json { render :show, status: :created, location: @order }
    else
      format.html { render :new }
      format.json { render json: @order.errors, status: :unprocessable_entity }
    end
  end
end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @categories = Category.all
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @categories = Category.all
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:name, :address, :email, :pay_type,:contact,:user_id)
  end

  def admin_user
    redirect_to(store_url) unless current_user.admin?
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "please log in"
      redirect_to login_url
    end
  end
end
