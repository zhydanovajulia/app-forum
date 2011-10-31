class PostsController < ApplicationController
  
def create
   @title = "New Post"
   @theme = Theme.find(params[:theme_id])
  

  
   @post =current_user.posts.build(params[:post])
   @post.theme_id = params[:theme_id]

    if @post.save
      flash[:success] = "Post created!"
      redirect_to @theme
    else
      @posts = []
      render 'themes/show'
    end
end





end
