require "rails_helper"

RSpec.describe Game, type: :model do
  it { is_expected.to validate_presence_of :player_1 }
  it { should validate_inclusion_of(:state).in_array(%w(search started finished)) }
end
