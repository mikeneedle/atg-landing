class ExperiencesController < ApplicationController
	def new
	  @experience = Experience.new
	end
	
	def index
	  @experiences = Experience.all
	  #.order('description ASC')
    #@locations = Location.all 
    #below will incorporate pagination at 5 per view
    #@articles = Article.paginate(page: params[:page], per_page: 5)
  end
	
  def create
  	@experience = Experience.new(experience_params) #to whitelist data for entry so it can be saved
    if @experience.save #if saved ok
      flash[:success] = "Location was successfully created" #outputs a notice to user all is well
      redirect_to experiences_path #after the trip is saved, send the browser to show what is now in the trip table
    else #issue with the save
      render 'new' #display form for user to try again
    end
	end
	
	def show
    @experience = Experience.find(params[:id])
    #@articles = @article.paginate(page: params[:page], per_page: 5)
  end
	
	def edit
	  @experience = Experience.find(params[:id])
  end
  
  def update
    @experience = Experience.find(params[:id])
    if @experience.update(experience_params)
      flash[:success] = "Experience name was successfully updated"
      redirect_to experience_path(@experience)
    else
      render 'edit'
    end
  end
	
	def destroy
    #find the article to edit based on the form variable
    @experience = Experience.find(params[:id])
    @experience.destroy #command to update with whitelisted (article_params) input
    flash[:success] = "Location was successfully destroyed (boom sauce!)" #outputs a notice to user all is well
    redirect_to experiences_path #after the article is saved, send the browser to show what is now in the article table
  end
	
	private
  def experience_params
    #params.require(:article).permit(:title, :description, category_ids: [])
    params.require(:experience).permit(:description)
  end
  
  def set_location
    @experience = Experience.find(params[:id])
  end
  
end
