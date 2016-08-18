class RoundQuestion < ActiveRecord::Base
  belongs_to :round
  belongs_to :question
end
