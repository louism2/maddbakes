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
  
private

  def comment_parameters
    params.require(:comment).permit(:content, :commenter_name, :post_id)
  end  
  
end
