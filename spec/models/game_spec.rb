require "rails_helper"

describe Game do
  let!(:game) { create :game }

  it { is_expected.to validate_presence_of :player_1 }

  it "valid" do
    expect(game).to be_valid
  end
end
