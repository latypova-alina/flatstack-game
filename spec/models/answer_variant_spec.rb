require "rails_helper"

describe AnswerVariant do
  it { is_expected.to validate_presence_of :answer }
end
