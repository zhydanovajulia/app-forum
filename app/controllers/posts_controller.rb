class PostsController < ApplicationController
  
def create
   @title = "New Post"
   @theme = Theme.find(params[:theme_id])
   @post  = @theme.posts.build(params[:post])
    if @post.save
      flash[:success] = "Theme created!"
      redirect_to @theme
    else
      @posts = []
      render 'themes/show'
    end
end





end
