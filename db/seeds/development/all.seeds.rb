2.times { FactoryGirl.create :user }

FactoryGirl.create :user, :administrator
FactoryGirl.create :user, :bot
