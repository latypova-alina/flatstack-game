class Question < ActiveRecord::Base
  has_many :answers

  validate :answers_count
  validate :right_answers

  def answers_count
    errors.add(:question, "have not enough answers") if answers.size < 4
    errors.add(:question, "can't have more than four answers") if answers.size > 4
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
