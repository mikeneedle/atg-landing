class FlexiblesController < ApplicationController
	def new
	  @flexible = Flexible.new
	end
	
	def index
	  @flexibles = Flexible.all
	  #order('description ASC')
    #@locations = Location.all 
    #below will incorporate pagination at 5 per view
    #@articles = Article.paginate(page: params[:page], per_page: 5)
  end
	
  def create
  	@flexible = Flexible.new(flexible_params) #to whitelist data for entry so it can be saved
    if @flexible.save #if saved ok
      flash[:success] = "Location was successfully created" #outputs a notice to user all is well
      redirect_to flexibles_path #after the trip is saved, send the browser to show what is now in the trip table
    else #issue with the save
      render 'new' #display form for user to try again
    end
	end
	
	def show
    @flexible = Flexible.find(params[:id])
    #@articles = @article.paginate(page: params[:page], per_page: 5)
  end
	
	def edit
	  @flexible = Flexible.find(params[:id])
  end
  
  def update
    @flexible = Flexible.find(params[:id])
    if @flexible.update(flexible_params)
      flash[:success] = "Location name was successfully updated"
      redirect_to flexible_path(@flexible)
    else
      render 'edit'
    end
  end
	
	def destroy
    #find the article to edit based on the form variable
    @flexible = Flexible.find(params[:id])
    @flexible.destroy #command to update with whitelisted (article_params) input
    flash[:success] = "Location was successfully destroyed (boom sauce!)" #outputs a notice to user all is well
    redirect_to locations_path #after the article is saved, send the browser to show what is now in the article table
  end
	
	private
  def flexible_params
    #params.require(:article).permit(:title, :description, category_ids: [])
    params.require(:flexible).permit(:description)
  end
  
  def set_location
    @flexible = Flexible.find(params[:id])
  end
  
end
