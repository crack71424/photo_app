class CommentsController < ApplicationController

  def index
  
  end
    
  def create    #@comment.user_id = current_user.id
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    #@comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントに成功しました！"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "コメントに失敗しました！"
      redirect_back(fallback_location: root_path)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment_content, :post_id)
    end
end
