class Question < ActiveRecord::Base
  validates :category, presence: true

  belongs_to :category
  has_many :answer_variants
  has_many :player_answers

  accepts_nested_attributes_for :answer_variants
end
