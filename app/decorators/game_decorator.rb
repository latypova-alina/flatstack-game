class GameDecorator < ApplicationDecorator
  delegate_all

  def score
    if object.first_player == current_user
      return "#{object.player_answers.where(user: first_player, truthy: true)} : #{object.player_answers.where(user: second_player, truthy: true)}"
    else
      return "#{object.player_answers.where(user: second_player, truthy: true)} : #{object.player_answers.where(user: first_player, truthy: true)}"
    end
  end
end
