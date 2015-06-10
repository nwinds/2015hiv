class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # must this line added every time I add in a model(to make sure wishlist won't cause a crash of the site? horriable)
  before_action :set_wishlist, only: [:new, :show, :update, :index]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @wishlist = current_wishlist
    if @wishlist.line_items.empty? # avoid creating nil order
      respond_to do |format|
        format.html { redirect_to products_url, notice: 'You wishlist is empty.' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end

    @order = Order.new
    respond_to do |format|
      format.html #{ redirect_to @order, notice: 'Order was successfully created.' }
      format.json { render :new, status: :created, location: @order }
    end


  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_wishlist(current_wishlist)

    respond_to do |format|
      if @order.save
        Wishlist.destroy(session[:wishlist_id])   # whenever an order created, items should not remains in wishlist
        session[:wishlist_id] = nil

        # redirect to store index(cause user may want to do something other than viewing products)
        format.html { redirect_to store_url, notice: 'Congratulations! Order was successfully created.' }
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
      params.require(:order).permit(:name, :email)
    end
end
