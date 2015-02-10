class EventsController < ApplicationController
  
  def index 
  	@events = Event.all 
  end 



  def new
    @location = Location.find(params[:location_id])
  	@event = Event.new
  end


  def create
      @event = Event.new(event_params)
      @location = Location.find(params[:location_id])
      @event.location_id = @location
      if @event.save
        redirect_to locations_path notice: 'Event was successfully created.'       
      else
        render :new
      end
  end


  def show
  	@event = Event.find(params[:id])
  	@location = @event.location
  end

  def update
    if @event.update(event_params)
        redirect_to locations_path, notice: 'Event was successfully updated.'
      else
        render :edit 
      end
  end

  def edit
  	@event =Event.find(params[:id])
  end
end

def destroy
      @event = Event.find(params[:id])
      @event.destroy
      redirect_to locations_path, notice: 'Event was successfully deleted.'
    end



private
    def event_params
      params.require(:event).permit(:description, :date, :requires_id)
    end






