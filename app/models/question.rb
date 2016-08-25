class Question < ActiveRecord::Base
  has_many :answers
  has_one :round_question
  accepts_nested_attributes_for :answers, allow_destroy: true

  validate :right_answers

  def answers_count
    errors.add(:question, "should have 4 answers") if answers.count != 4
  end

  def right_answers
    count = 0
    answers.each do |answer|
      answer.truthy? && count += 1
    end
    errors.add(:question, "must have one right answer") if count < 1
    errors.add(:question, "can't have more than one right answer") if count > 1
  end
end
