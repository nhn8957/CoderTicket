class EventsController < ApplicationController


  def new
  	@events = Event.new
    @categories = Category.all
    @venues = Venue.all
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = 'Event created'
      redirect_to events_path
    else
      raise @event.errors.full_messages.to_sentence
      redirect_to new_event_path
    end
  end

  def index
    @events = Event.all    
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy

  end

  def event_of_user
      load_user
      @events = @user.user_event
  end

  private
	def event_params
		params.require(:event).permit(:name, :starts_at, :ends_at, :venue_id, :category_id, :short_description, :hero_image_url, :extended_html_description)
	end
end
