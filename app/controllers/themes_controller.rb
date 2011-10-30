class ThemesController < ApplicationController
  before_filter :authenticate

  def create
  @title = "New theme"
  @theme  = current_user.themes.build(params[:theme])
  current_theme=@theme
    if @theme.save
      flash[:success] = "Theme created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'pages/home'
    end
  end

   def show
    @theme = Theme.find(params[:id])
    @posts = @theme.posts.paginate(:page => params[:page])
    @post = Post.new
    @title = @theme.content
   end


  def destroy
  end
end
