class TripsController < ApplicationController
	def new
	  @trip = Trip.new
	end
	
	def index
    @trips = Trip.all # commented out to do pagination
    #below will incorporate pagination at 5 per view
    #@articles = Article.paginate(page: params[:page], per_page: 5)
  end
	
  def create
  	@trip = Trip.new(trip_params) #to whitelist data for entry so it can be saved
    if @trip.save #if saved ok
      flash[:success] = "Trip was successfully created" #outputs a notice to user all is well
      redirect_to trips_path #after the trip is saved, send the browser to show what is now in the trip table
    else #issue with the save
      render 'new' #display form for user to try again
    end
	end
	
	def show
    @trip = Trip.find(params[:id])
    #@articles = @article.paginate(page: params[:page], per_page: 5)
  end
	
	def edit
	  @trip = Trip.find(params[:id])
  end
  
  def update
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      flash[:success] = "Trip data was successfully updated"
      redirect_to trip_path(@trip)
    else
      render 'edit'
    end
  end
	
	def destroy
    #find the article to edit based on the form variable
    @trip = Trip.find(params[:id])
    @trip.destroy #command to update with whitelisted (article_params) input
    flash[:success] = "Trip was successfully destroyed (boom sauce!)" #outputs a notice to user all is well
    redirect_to trips_path #after the article is saved, send the browser to show what is now in the article table
  end
	
	private
  def trip_params
    #params.require(:article).permit(:title, :description, category_ids: [])
    #params.require(:activity).permit(:description)
    #params.require(:article).permit(:title, :description, category_ids: [])
    params.require(:trip).permit(:first_name, :last_name, :email, :details, :booked, :location_id, :experience_id, :start_date, :end_date, :flexible_id, :group_size, activity_ids: [])
  end
  
  def set_trip
    @trip = Trip.find(params[:id])
  end
  
end
