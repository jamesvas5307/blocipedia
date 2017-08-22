class WikisController < ApplicationController

  def index
    @wikis = Wiki.all
  end
  def new
    @wiki = Wiki.new
  end
  def create
  @wiki = Wiki.new
  @wiki.title = params[:wiki][:title]
  @wiki.body = markdown_content(params[:wiki][:body])
  @wiki.private = params[:wiki][:private]
  @wiki.user = current_user

    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      # if no successful alert the user and render the new view again.
      flash.now[:alert] = "There was an error saving the wiki. Please try again"
      render :new
    end
  end
  def edit
    @wiki = Wiki.find(params[:id])
  end
  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.update_attributes( wiki_params )
      @wiki.title = markdown_content(@wiki.title)
      @wiki.body = markdown_content(@wiki.body)
      flash[:notice] = "Wiki was updated."
      redirect_to  @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again"
      render :edit
    end
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def destroy
     @wiki = Wiki.find(params[:id])
     authorize @wiki
     if @wiki.destroy
       flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
       redirect_to wikis_path
     else
       flash.now[:alert] = "There was an error deleting the wiki."
       render :show
     end
   end
  private
    def wiki_params
      params.require(:wiki).permit( :title, :body, :private )
    end


  def markdown_content(body)
     markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(body)
  end
end
