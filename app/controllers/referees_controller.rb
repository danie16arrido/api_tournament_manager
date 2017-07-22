class RefereesController < ApplicationController
  def index
    all_referees = Referee.all
    render :json => all_referees
  end

  def show
    referee= Referee.find( params[:id])
    render :json => referee
  end

  def create
    leagueFinder = League.find( referee_params[:league])
    referee= Referee.create( {name: referee_params[:name], last_name: referee_params[:last_name], league: leagueFinder } )
    render json: referee, status: :created
  end

  def update
    referee= Referee.find( params[:id])
    leagueFinder = League.find( referee_params[:league])

    if referee.update_attributes( { name: referee_params[:name], last_name: referee_params[:last_name], league: leagueFinder } )
      render :json => referee
    else
      render :json => { status: :update_failed }
    end
  end

  def destroy
    referee= Referee.find( params[:id] )
    if referee.destroy
      render :json =>  { status: :success }
    else
      render :json =>  { status: :delete_failed }
    end
  end  

  private

  def referee_params
    params.require(:referee).permit([:name, :last_name, :league])
  end

end