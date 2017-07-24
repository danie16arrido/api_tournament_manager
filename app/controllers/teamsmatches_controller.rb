class TeamsmatchesController < ApplicationController
  def index
    match = Match.find(params[:match_id])
    teams_in_match = []
    teams_in_match.push(Team.find( match.home_id))
    teams_in_match.push(Team.find( match.away_id))
    
    # render :json => teams_in_match
    render :json => match.as_json({
      include: {
            home: {
              only: ["name"]
            },
            away: {
              only: ["name"]
            }
          }
        })
  end

  def show
    team = Team.find( params[:id])
    render :json => team
  end

  def create
    leagueFinder = League.find( team_params[:league])
    team= Team.create( {name: team_params[:name], league: leagueFinder } )
    render json: team, status: :created
  end

  def update
    team= Team.find( params[:id])
    leagueFinder = League.find( team_params[:league])

    if team.update_attributes( { name: team_params[:name], league: leagueFinder } )
      render :json => team
    else
      render :json => { status: :update_failed }
    end
  end

  def destroy
    team= Team.find( params[:id] )
    if team.destroy
      render :json =>  { status: :success }
    else
      render :json =>  { status: :delete_failed }
    end
  end  

  private

  def team_params
    params.require(:team).permit([:name, :league])
  end

end