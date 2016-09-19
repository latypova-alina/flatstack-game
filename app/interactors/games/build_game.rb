module Games
  class BuildGame
    include Interactor::Organizer

    organize CreateGame, Rounds::CreateRounds, Questions::CreateRoundsQuestions
  end
end
