class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_wishlist, only: [:index, :show, :edit, :new]

  # GET /products
  # GET /products.json
  # added simple search by one single query
  # use will_paginate in paging
  def index 
    if params[:search]
      # @products = Product.order("created_at DESC").search(params[:search].paginate(page: page, per_page: 10)
      @products = Product.search(params[:search], params[:page])
    else
      @products = Product.paginate(:page => params[:page], :per_page => 10)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json {render json: @products}
    end

  end


  # GET /products/1
  # GET /products/1.json
  def show
    # set_wishlist()
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    # set_wishlist()
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  # first get the do be destroied product: delete all its comments and then delete the product
  def destroy
    # delete product itself
    respond_to do |format|
      if @product.destroy
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
      else
        format.html { redirect_to products_url, notice: 'Product failed to destroy.' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def who_bought
    @product = Product.find(params[:id])
    respond_to do |format|
      format.atom
      format.xml {render xml: @product}
    end
  end

    

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end   

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :detail, :icon_url, :price)
    end
end
