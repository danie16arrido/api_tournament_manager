class LocationsController < ApplicationController
  def index
    all_locations = Location.all
    render :json => all_locations
  end

  # def show
  #   location= Location.find( params[:id])
  #   render :json => location
  # end

  # def create
  #   leagueFinder = League.find( location_params[:league])
  #   location= Location.create( {name: location_params[:name], league: leagueFinder } )
  #   render json: location, status: :created
  # end

  # def update
  #   location= Location.find( params[:id])
  #   leagueFinder = League.find( location_params[:league])

  #   if location.update_attributes( { name: location_params[:name], league: leagueFinder } )
  #     render :json => location
  #   else
  #     render :json => { status: :update_failed }
  #   end
  # end

  # def destroy
  #   location= Location.find( params[:id] )
  #   if location.destroy
  #     render :json =>  { status: :success }
  #   else
  #     render :json =>  { status: :delete_failed }
  #   end
  # end  

  private

  def location_params
    params.require(:location).permit([:name, :league])
  end

end