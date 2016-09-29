class PlayerAnswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  belongs_to :question
  belongs_to :answer_variant
end
