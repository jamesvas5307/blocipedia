class CollaboratorsController < ApplicationController
  def new
  @wiki = Wiki.find(params[:wiki_id])
  @collaborator = Collaborator.new
  end

  def create
  @collaborator = Collaborator.new
  @collaborator.user_id = params[:collaborator][:user]
  @wiki = Wiki.find(params[:wiki_id])
  @collaborator.wiki = @wiki
  @users = User.all

    if @collaborator.save
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

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
     @collaborator = Collaborator.find(params[:id])
     if @collaborator.destroy
       flash[:notice] = "Deleted successfully."
       redirect_to @wiki
     else
       flash.now[:alert] = "There was an error deleting the user."
       render :show
     end
   end
end
