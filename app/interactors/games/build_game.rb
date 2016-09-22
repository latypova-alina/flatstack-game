module Games
  class BuildGame
    include Interactor::Organizer

    organize CreateGame, ChangeStateGame, Rounds::CreateRounds, Questions::CreateRoundsQuestions
  end
end
