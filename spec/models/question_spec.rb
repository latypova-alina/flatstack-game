require "rails_helper"

describe Question do
  it { is_expected.to validate_presence_of :category }
  it { is_expected.to validate_presence_of :question }
  it { is_expected.to validate_uniqueness_of :question }
end
