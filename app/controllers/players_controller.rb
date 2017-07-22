class PlayersController < ApplicationController
  def index
    all_players = Player.all
    render :json => all_players
  end

  def show
    player= Player.find( params[:id])
    render :json => player
  end

  def create
    players_team = Team.find( player_params[:team])
    player =  Player.create( getPlayerObject( players_team ) )
    render json: player, status: :created
  end

  def update
    player= Player.find( params[:id])
    players_team = Team.find( player_params[:team])
    if player.update_attributes( getPlayerObject( players_team ) )
      render :json => player
    else
      render :json => { status: :update_failed }
    end
  end

  def destroy
    player= Player.find( params[:id] )
    if player.destroy
      render :json =>  { status: :success }
    else
      render :json =>  { status: :delete_failed }
    end
  end  

  private

  def player_params
    params.require(:player).permit([:name, :last_name, :team, :age, :height, :weight])
  end

  def getPlayerObject( players_team )
      updated_player =
        {
        name: player_params[:name], 
        last_name: player_params[:last_name], 
        team: players_team, 
        age:player_params[:age],
        height:player_params[:height],
        weight:player_params[:weight]  
        }    
      return updated_player
  end

end