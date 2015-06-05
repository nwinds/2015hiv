class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

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

  # # PATCH/PUT /comments/1/edit
  # # PATCH/PUT /comments/1.json/edit
  # def commit
  #   respond_to do |format|
  #     if @comment.update(comment_params)
  #       format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @comment }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @comment.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end


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
  def update
    # params.require(params[:comment]).permit(params[:commenter], params[:body], params[:product_id])

    respond_to do |format|
      if @comment.update(params.require(params[:comment]).permit(params[:commenter], params[:body], params[:product_id]))
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
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
