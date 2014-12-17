class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_parameters)
    if @comment.save
      flash[:success] = "Thanks for the comment"
      redirect_to post_path(@comment.post_id)
    else
      flash[:error] = "hmmmm... check that comment"
      @post = Post.find(@comment.post_id)
      render 'posts/show'
    end  
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = "Girl, fuck that comment"
    else
      flash[:error] = "Soemthing went wrong and the post wasn't deleted.  Try again."
    end  
    redirect_to root_path
  end
  
private

  def comment_parameters
    params.require(:comment).permit(:content, :commenter_name, :post_id)
  end  
  
end
