class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :update]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # POST /line_items
  # POST /line_items.json
  def create
    @wishlist = current_wishlist
    product = Product.find(params[:product_id]) # product_id is passed by button
    @line_item = @wishlist.add_product(product.id) # create a product found before

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to products_url, notice: 'Line item was successfully added in.' }
        format.js
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /line_items
  # POST /line_items.json
  def edit
    @wishilist = current_wishlist
    product = Product.find(params[:product_id]) # product_id is passed by button
    @line_item = @wishilist.minus_product(product.id) # create a product found before
    
    if @line_item
      respond_to do |format|
        if @line_item.save
          format.html { redirect_to @line_item.wishlist, notice: 'Line item was successfully decreased.' }
          format.json { render :show, status: :created, location: @line_item }
        else
          format.html { redirect_to products_url, notice: "Line item cannot decrease" }
          format.json { render json: @line_item.errors, status: :unprocessable_entity }
        end
      end
    else
      # if no items inside a wishlist, the list will not be destroied currently!
      respond_to do |format|
        format.html { redirect_to @wishilist, notice: 'Line item was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @wishlist = current_wishlist
    begin
      @wishlist.destroy_line_item(params[:product_id])
    rescue NoMethodError
        logger.error "Failed to destroy wishlist#{params[:id]} with invalid product_id#{params[:product_id]}."
        redirect_to products_url, notice: "Line item failed to destroy."
    else
      respond_to do |format|
        format.html { redirect_to products_url, notice: 'Line item was successfully destroyed.' }
        format.js
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :wishlist_id)
    end
end
