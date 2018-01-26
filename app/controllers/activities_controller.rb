class ActivitiesController < ApplicationController
	def new
	  @activity = Activity.new
	end
	
	def index
	  @activities = Activity.order('description ASC')
    #@activities = Activity.all # commented out to do pagination
    #below will incorporate pagination at 5 per view
    #@articles = Article.paginate(page: params[:page], per_page: 5)
  end
	
  def create
  	@activity = Activity.new(activity_params) #to whitelist data for entry so it can be saved
    if @activity.save #if saved ok
      flash[:success] = "Trip was successfully created" #outputs a notice to user all is well
      redirect_to activities_path #after the trip is saved, send the browser to show what is now in the trip table
    else #issue with the save
      render 'new' #display form for user to try again
    end
	end
	
	def show
    @activity = Activity.find(params[:id])
    @trip_activities = @trip.activities
    #@articles = @article.paginate(page: params[:page], per_page: 5)
  end
	
	def edit
	  @activity = Activity.find(params[:id])
  end
  
  def update
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      flash[:success] = "Activity name was successfully updated"
      redirect_to activity_path(@activity)
    else
      render 'edit'
    end
  end
	
	def destroy
    #find the article to edit based on the form variable
    @activity = Activity.find(params[:id])
    @activity.destroy #command to update with whitelisted (article_params) input
    flash[:success] = "Activity was successfully destroyed (boom sauce!)" #outputs a notice to user all is well
    redirect_to activities_path #after the article is saved, send the browser to show what is now in the article table
  end
	
	private
  def activity_params
    #params.require(:article).permit(:title, :description, category_ids: [])
    params.require(:activity).permit(:description)
  end
  
  def set_activity
    @activity = Activity.find(params[:id])
  end
  
end
