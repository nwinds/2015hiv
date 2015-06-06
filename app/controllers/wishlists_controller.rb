class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:show, :edit, :update, :destroy]

  # GET /wishlists
  # GET /wishlists.json
  def index
    @wishlists = Wishlist.all
  end

  # GET /wishlists/1
  # GET /wishlists/1.json
  def show
  end

  # GET /wishlists/new
  def new
    @wishlist = Wishlist.new
  end

  # GET /wishlists/1/edit
  def edit
  end

  # POST /wishlists
  # POST /wishlists.json
  def create
    @wishlist = Wishlist.new(wishlist_params)

    respond_to do |format|
      if @wishlist.save
        format.html { redirect_to @wishlist, notice: 'Wishlist was successfully created.' }
        format.json { render :show, status: :created, location: @wishlist }
      else
        format.html { render :new }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wishlists/1
  # PATCH/PUT /wishlists/1.json
  def update
    respond_to do |format|
      if @wishlist.update(wishlist_params)
        format.html { redirect_to @wishlist, notice: 'Wishlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @wishlist }
      else
        format.html { render :edit }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishlists/1
  # DELETE /wishlists/1.json
  def destroy
    @wishlist = current_wishlist
    @wishlist.destroy
    # use session to 'know' if there is a wishlist or not
    session[:wishlist_id] = nil # 'destroy in db, empty in session'

    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Your Wishlist is emptie now. Back to Product list.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Improved with wrong wishlist id handle
    def set_wishlist
      begin
        @wishlist = Wishlist.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        logger.error "Attempt to access invalid wishlist #{params[:id]}"
        redirect_to products_path, notice: "Invalid wishlist"
      else
        respond_to do |format|
          format.html {render :show} # show.html.erb
          format.json {render json: @wishlist}
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wishlist_params
      params[:wishlist]
    end
end
