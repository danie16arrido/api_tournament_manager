class LeaguesController < ApplicationController
  def index
    render :json => {hola: "hi"}
  end
end