class Round < ActiveRecord::Base
  after_initialize :default_status

  belongs_to :game
  belongs_to :current_round_question, class_name: "RoundQuestion", foreign_key: "current_round_question_id"

  has_many :round_questions, dependent: :destroy

  belongs_to :category

  enum status: {
    waiting: "waiting",
    in_progress: "in_progress",
    finished: "finished"
  }

  private

  def default_status
    self.status ||= "waiting"
  end

  # def questions_count
  #   errors.add(:round, "must have 4 questions") if questions.count != 4
  # end
end
