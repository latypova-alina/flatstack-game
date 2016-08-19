require "rails_helper"

RSpec.describe RoundQuestion, type: :model do
  it { is_expected.to validate_presence_of :round_id }
  it { is_expected.to validate_presence_of :question_id }
end
