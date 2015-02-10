class LocationsController < ApplicationController
  
  def index
  	@locations = Location.all
  end

  def new
  	@location = Location.new
  end

  def create
      @location = Location.new(location_params)
      if @location.save
          redirect_to locations_path, notice: 'Location was successfully created.' 
      else
       render :new 
      end
  end

    def update
      @location = Location.find(params[:id])
    if @location.update(location_params)
        redirect_to locations_path, notice: 'Event was successfully updated.'
      else
        render :edit 
      end
  end



  def show
  	@location = Location.find(params[:id])
  end

  def edit
  	@location = Location.find(params[:id])
  end

def destroy
      @location = Location.find(params[:id])
      @location.destroy
      redirect_to locations_path, notice: 'Event was successfully deleted.'
    end

private
    def location_params
      params.require(:location).permit(:name, :address, :zipcode)
    end
end 