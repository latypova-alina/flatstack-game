class GamesController < ApplicationController
  def index
  end

  def new
  end

  def create
    @game = Game.new
    if @game.save
      flash[:notice] = "Game successfully created."
    else
      flash[:notice] = "Error creating game."
    end
    
    redirect_to root_url
  end
end
