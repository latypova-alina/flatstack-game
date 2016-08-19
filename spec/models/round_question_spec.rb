require "rails_helper"

describe RoundQuestion do
  it { is_expected.to validate_presence_of :round_id }
  it { is_expected.to validate_presence_of :question_id }
end
