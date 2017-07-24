class LeaguesController < ApplicationController
  def index
    all_leagues = League.all
    render :json => all_leagues
  end

  def show
    league = League.find( params[:id])
    render :json =>  
    # league
    league.as_json({
      except:[:created_at, :updated_at],
      include:{
        matches: {
          only: [:home_id, :away_id, :location_id, :referee_id, :date, :time]
          }
        }
      
    })
  end

  def create
    league = League.create( league_params )
    render json: league, status: :created
  end

  def update
    league = League.find( params[:id])
    if league.update_attributes( league_params )
      render :json => league
    else
      render :json => { status: :update_failed }
    end
  end

  def destroy
    league = League.find( params[:id] )
    if league.destroy
      render :json =>  { status: :success }
    else
      render :json =>  { status: :delete_failed }
    end
  end  

  private

  def league_params
    params.require(:league).permit([:name])
  end

end