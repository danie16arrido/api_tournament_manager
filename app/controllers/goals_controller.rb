class GoalsController < ApplicationController
  def index
    all_goals = Goal.all
    render :json => all_goals
  end

  def show
    goal= Goal.find( params[:id])
    render :json => goal
  end

  def create
    goal =  Goal.create( getGoalsObject( goal_params ) )
    render json: goal, status: :created
  end

  def update
    goal= Goal.find( params[:id])
    if goal.update_attributes( getGoalsObject( goal_params ) )
      render :json => goal
    else
      render :json => { status: :update_failed }
    end
  end

  def destroy
    goal= Goal.find( params[:id] )
    if goal.destroy
      render :json =>  { status: :success }
    else
      render :json =>  { status: :delete_failed }
    end
  end  

  private

  def goal_params
    params.require(:goal).permit([:player, :match, :category, :minute])
  end

  def getGoalsObject( goal_params)
      created_goal =
        {
        player: findPlayer( goal_params[:player]),
        match: findMatch( goal_params[:match] ),
        category: goal_params[:category],
        minute: goal_params[:minute]
        }    
      return created_goal
  end

  def findPlayer( id )
    Player.find( id )  
  end

  def findMatch( id )
    Match.find( id )  
  end

end