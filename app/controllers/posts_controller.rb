class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :show]

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿に成功しました！"
      redirect_to root_url
    else
      render 'toppages/home'
    end
  end

  def index
    @posts = Post.all
    #@posts = current_user.posts.all
    #@post = current_user.post.new #新規投稿を行うの際のformパラメーター用
  end

  def new
    @post = Post.new
  end

  def show
    @user = User.find(params[:id])
    @post = Post.find(params[:id])
    @comments = @post.comments
    #@comment = current_user.comments.new
    @comment = Comment.new
  end

  def destroy
  end

  private

    def post_params
      params.require(:post).permit(:name, :content)
    end
end
