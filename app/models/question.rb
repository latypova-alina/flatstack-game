class Question < ActiveRecord::Base
  validates :category, presence: true

  belongs_to :category
  has_many :answers

  accepts_nested_attributes_for :answers
end
