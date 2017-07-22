class CardsController < ApplicationController
  def index
    all_cards = Card.all
    render :json => all_cards
  end

  def show
    card= Card.find( params[:id])
    render :json => card
  end

  def create
    card =  Card.create( getCardsObject( card_params ) )
    render json: card, status: :created
  end

  def update
    card= Card.find( params[:id])
    if card.update_attributes( getCardsObject( card_params ) )
      render :json => card
    else
      render :json => { status: :update_failed }
    end
  end

  def destroy
    card= Card.find( params[:id] )
    if card.destroy
      render :json =>  { status: :success }
    else
      render :json =>  { status: :delete_failed }
    end
  end  

  private

  def card_params
    params.require(:card).permit([:player, :match, :colour, :minute])
  end

  def getCardsObject( card_params)
      created_card =
        {
        player: findPlayer( card_params[:player]),
        match: findMatch( card_params[:match] ),
        colour: card_params[:colour],
        minute: card_params[:minute]
        }    
      return created_card
  end

  def findPlayer( id )
    Player.find( id )  
  end

  def findMatch( id )
    Match.find( id )  
  end

end