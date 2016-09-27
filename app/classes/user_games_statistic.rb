class UserGamesStatistic
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def games
    {
      finished: finished_games,
      current: current_games,
      correct_answers: correct_answers,
      won: won,
      failed: failed
    }
  end

  private

  def finished_games
    @user.games.finished
  end

  def current_games
    @user.games.where.not(state: "finished")
  end

  def correct_answers
    @user.player_answers.where(truthy: true).count
  end

  def won
    @user.games.where(winner: @user).count
  end

  def failed
    @user.games.finished.where.not(winner: @user).count
  end
end
