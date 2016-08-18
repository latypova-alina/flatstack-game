require "rails_helper"

RSpec.describe Round, type: :model do
  it { should validate_length_of(:questions).is_equal_to(4) }
end
