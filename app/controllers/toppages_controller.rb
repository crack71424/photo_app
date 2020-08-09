class ToppagesController < ApplicationController
  def home
    @post = current_user.post.build if logged_in?
  end

  def show
    
  end
end
