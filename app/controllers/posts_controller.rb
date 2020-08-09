class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿に成功しました！"
      redirect_to root_url
    else
      render 'toppages/home'
    end
  end

  def destroy
  end

  private

    def post_params
      params.require(:post).permit(:name, :content)
    end
end
