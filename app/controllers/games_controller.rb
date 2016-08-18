class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(params[:game])
    @game.player_1 = current_user.id
    @game.state = "search"

    flash[:notice] = if @game.save
      "Game successfully created."
    else
      "Error creating game."
    end

    redirect_to action: :index
  end
end
