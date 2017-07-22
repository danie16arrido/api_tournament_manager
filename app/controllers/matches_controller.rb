class MatchesController < ApplicationController
  def index
    all_matches = Match.all
    render :json => all_matches
  end

  def show
    match= Match.find( params[:id])
    render :json => match
  end

  def create
    match =  Match.create( getMatcheObject( match_params ) )
    render json: match, status: :created
  end

  def update
    match= Match.find( params[:id])
    if match.update_attributes( getMatcheObject( match_params ) )
      render :json => match
    else
      render :json => { status: :update_failed }
    end
  end

  def destroy
    match= Match.find( params[:id] )
    if match.destroy
      render :json =>  { status: :success }
    else
      render :json =>  { status: :delete_failed }
    end
  end  

  private

  def match_params
    params.require(:match).permit([:home, :away, :date, :time, :league, :location, :referee])
  end

  def getMatcheObject( matches_team )
      created_match =
        {
        home: findTeam( match_params[:home] ),
        away: findTeam( match_params[:away] ),
        date: match_params[:date],
        time: match_params[:time],
        league: findLeague( match_params[:league] ),
        location: findLocation( match_params[:location] ),
        referee: findReferee( match_params[:referee] )
        }    
      return created_match
  end

  def findTeam( id )
    Team.find( id )  
  end

  def findLeague( id )
    League.find( id )  
  end

  def findLocation( id )
    Location.find( id )
  end

  def findReferee( id )
    Referee.find( id )
  end

end