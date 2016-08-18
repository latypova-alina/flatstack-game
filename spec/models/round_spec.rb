require "rails_helper"

RSpec.describe Round, type: :model do
  it { is_expected.to validate_presence_of :game_id }
end
