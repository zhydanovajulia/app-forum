class PostsController < ApplicationController
  
def create
   @title = "New Post"
   @theme = Theme.find(params[:id])
   @post  = @theme.posts.build(params[:post])
    if @post.save
      flash[:success] = "Theme created!"
      redirect_to root_path
    else
   
      render 'pages/home'
    end
end





end
