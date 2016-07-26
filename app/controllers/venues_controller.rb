class VenuesController < ApplicationController
  

  def new
    @venue = Venue.new
    @regions = Region.all
  end

  def create
    @venue = Venue.new(venue_params)

    if @venue.save
      flash[:success] = "Add venue successfully"
      redirect_to root_path
    else
      flash[:error] = @venue.errors.full_messages.to_sentence
      redirect_to new_venue_path
    end
  end

  private

    def venue_params
      params.require(:venue).permit(:name, :full_address, :region_id)
    end
end

