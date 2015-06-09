class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_wishlist, only: [:show, :edit, :destroy]
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.create(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @product, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { redirect_to @product, notice: 'Comment failed to create!' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  # can only update body(auther and ids cannot be modified currently)
  def update
    @product = Product.find(params[:product_id])
    respond_to do |format|
      if Comment.update(params[:id], :body => params[:body])
        format.html { redirect_to @product, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :updated, location: @product }
      else
        format.html { render :edit, notice: 'Comment failed to update!' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1cd 
  # DELETE /comments/1.json
  def destroy
    @product = Product.find(params[:product_id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @product, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:commenter, :body, :product_id)
    end
end
