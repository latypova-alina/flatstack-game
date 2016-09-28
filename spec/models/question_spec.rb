require "rails_helper"

describe Question do
  it { is_expected.to validate_presence_of :category }
  it { is_expected.to validate_presence_of :question }
  it { is_expected.to validate_uniqueness_of :question }

  it "does not allow same questions" do
    FactoryGirl.create(:question, question: "Столица Индонезии — ...")
    expect(FactoryGirl.build(:question, question: "Столица Индонезии — ...")).not_to be_valid
  end
end
