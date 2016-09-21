module Questions
  class CreateRoundsQuestions
    include Interactor

    delegate :game, to: :context
    delegate :rounds, to: :game, prefix: true

    def call
      select_round_question
    end

    private

    def select_round_question
      game_rounds.each do |round|
        3.times do
          round.round_questions.create(question_id: Question.order("RANDOM()").first.id)
          game.save || context.fail!
        end
      end
    end
  end
end
