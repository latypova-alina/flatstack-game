class Question < ActiveRecord::Base
  validates :category, presence: true

  belongs_to :category
  has_many :answer_variants

  accepts_nested_attributes_for :answer_variants
end
