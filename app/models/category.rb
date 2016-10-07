class Category < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :questions

  def random_question
    questions.order("RANDOM()").first
  end
end
