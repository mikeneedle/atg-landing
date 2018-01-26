class LocationsController < ApplicationController
	def new
	  @location = Location.new
	end
	
	def index
	  @locations = Location.order('description ASC')
    #@locations = Location.all 
    #below will incorporate pagination at 5 per view
    #@articles = Article.paginate(page: params[:page], per_page: 5)
  end
	
  def create
  	@location = Location.new(location_params) #to whitelist data for entry so it can be saved
    if @location.save #if saved ok
      flash[:success] = "Location was successfully created" #outputs a notice to user all is well
      redirect_to locations_path #after the trip is saved, send the browser to show what is now in the trip table
    else #issue with the save
      render 'new' #display form for user to try again
    end
	end
	
	def show
    @location = Location.find(params[:id])
    #@articles = @article.paginate(page: params[:page], per_page: 5)
  end
	
	def edit
	  @location = Location.find(params[:id])
  end
  
  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      flash[:success] = "Location name was successfully updated"
      redirect_to location_path(@location)
    else
      render 'edit'
    end
  end
	
	def destroy
    #find the article to edit based on the form variable
    @location = Location.find(params[:id])
    @location.destroy #command to update with whitelisted (article_params) input
    flash[:success] = "Location was successfully destroyed (boom sauce!)" #outputs a notice to user all is well
    redirect_to locations_path #after the article is saved, send the browser to show what is now in the article table
  end
	
	private
  def location_params
    #params.require(:article).permit(:title, :description, category_ids: [])
    params.require(:location).permit(:description)
  end
  
  def set_location
    @location = Location.find(params[:id])
  end
  
end
