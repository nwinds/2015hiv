class FileManagersController < ApplicationController
  before_action :set_file_manager, only: [:show, :edit, :update, :destroy]
  before_action :set_wishlist, only: [:index, :show, :edit, :new, :create, :search]

  # GET /file_managers
  # GET /file_managers.json
  def index
    @file_managers = FileManager.paginate(:page => params[:page], :per_page => 10)
    # end
    respond_to do |format|
      format.html # index.html.erb
      format.json {render json: @file_managers}
    end

  end

  def search
    if params[:search]
      tempfile = FileManager.new(:file_avatar => params[:search], :product_id => 0)
      if tempfile.save
        @product = FileManager.search(tempfile.file_avatar)
        tempfile.destroy        
      end
    end    
    respond_to do |format|      
        format.html { render file_managers_url }
        format.json { head :no_content }
    end
  end

  # GET /file_managers/1
  # GET /file_managers/1.json
  def show
  end

  # GET /file_managers/new
  def new
    @file_manager = FileManager.new
  end

  # GET /file_managers/1/edit
  def edit
  end

  # POST /file_managers
  # POST /file_managers.json
  def create
    @file_manager = FileManager.new(file_manager_params)
    
    respond_to do |format|
      if @file_manager.save
        format.html { redirect_to @file_manager, notice: 'File manager was successfully created.' }
        format.json { render :show, status: :created, location: @file_manager }
      else
        format.html { render :new }
        format.json { render json: @file_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /file_managers/1
  # PATCH/PUT /file_managers/1.json
  def update
    respond_to do |format|
      if @file_manager.update(file_manager_params)
        format.html { redirect_to @file_manager, notice: 'File manager was successfully updated.' }
        format.json { render :show, status: :ok, location: @file_manager }
      else
        format.html { render :edit }
        format.json { render json: @file_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_managers/1
  # DELETE /file_managers/1.json
  def destroy
    @file_manager.destroy
    respond_to do |format|
      format.html { redirect_to file_managers_url, notice: 'File manager was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_manager
      @file_manager = FileManager.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_manager_params
      params.require(:file_manager).permit(:file_avatar)
    end
end
