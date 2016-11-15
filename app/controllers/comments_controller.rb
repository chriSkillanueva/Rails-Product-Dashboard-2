class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(comment:params[:comment], product_id:params[:id])
    if @comment.save
      redirect_to "/comments"
    else
      errors = @comment.errors
      flash[:comment_error] = errors['comment'].join(", ").capitalize
      redirect_to "/products/#{params[:id]}"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to "/products/#{@comment.product.id}"
  end

end
