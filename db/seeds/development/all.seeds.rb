require "csv"

2.times { FactoryGirl.create :user }

FactoryGirl.create :user, :administrator
FactoryGirl.create :user, :bot

CSV.foreach("db/seeds/questions.csv", headers: true, header_converters: :symbol) do |row|
  row = row.to_hash

  category = Category.find_or_create_by name: row[:category]

  next if Question.where(question: row[:question]).any?

  question = Question.create(question: row[:question], category: category)

  question.answer_variants.create(answer: row[:right_answer], truthy: 1)
  question.answer_variants.create(answer: row[:wrong_answer_1], truthy: 0)
  question.answer_variants.create(answer: row[:wrong_answer_2], truthy: 0)
  question.answer_variants.create(answer: row[:wrong_answer_3], truthy: 0)
end

FactoryGirl.create(:user, full_name: "Brian Wilson", email: "brian@gmail.com")
FactoryGirl.create(:user, full_name: "Peter Moore", email: "peter@gmail.com")
FactoryGirl.create(:user, full_name: "Ruby Jones", email: "ruby@gmail.com")

FactoryGirl.create(:game, first_player_id: 5, second_player_id: 7, state: "finished", winner_id: 7)
FactoryGirl.create(:game, first_player_id: 5, second_player_id: 7, state: "in_progress")
FactoryGirl.create(:game, first_player_id: 6, second_player_id: 5, state: "in_progress")


FactoryGirl.create(:round, game_id: 1, category_id: 2)
FactoryGirl.create(:round, game_id: 1, category_id: 6)
FactoryGirl.create(:round, game_id: 1, category_id: 17)

FactoryGirl.create(:round, game_id: 2, category_id: 15)

FactoryGirl.create(:round, game_id: 3, category_id: 3)
FactoryGirl.create(:round, game_id: 3, category_id: 1)

FactoryGirl.create(:round_question, round_id: 1, question_id: 17, first_player_answer_id: 66, second_player_answer_id: 66)
FactoryGirl.create(:round_question, round_id: 1, question_id: 21, first_player_answer_id: 81, second_player_answer_id: 81)
FactoryGirl.create(:round_question, round_id: 1, question_id: 12, first_player_answer_id: 45, second_player_answer_id: 46)

FactoryGirl.create(:round_question, round_id: 2, question_id: 61, first_player_answer_id: 241, second_player_answer_id: 241)
FactoryGirl.create(:round_question, round_id: 2, question_id: 62, first_player_answer_id: 246, second_player_answer_id: 245)
FactoryGirl.create(:round_question, round_id: 2, question_id: 65, first_player_answer_id: 257, second_player_answer_id: 257)

FactoryGirl.create(:round_question, round_id: 3, question_id: 203, first_player_answer_id: 810, second_player_answer_id: 809)
FactoryGirl.create(:round_question, round_id: 3, question_id: 198, first_player_answer_id: 792, second_player_answer_id: 792)
FactoryGirl.create(:round_question, round_id: 3, question_id: 194, first_player_answer_id: 774, second_player_answer_id: 773)

FactoryGirl.create(:round_question, round_id: 4, question_id: 176, first_player_answer_id: 701, second_player_answer_id: nil)
FactoryGirl.create(:round_question, round_id: 4, question_id: 179, first_player_answer_id: nil, second_player_answer_id: nil)
FactoryGirl.create(:round_question, round_id: 4, question_id: 180, first_player_answer_id: nil, second_player_answer_id: nil)

FactoryGirl.create(:round_question, round_id: 5, question_id: 35, first_player_answer_id: 137, second_player_answer_id: 139)
FactoryGirl.create(:round_question, round_id: 5, question_id: 25, first_player_answer_id: 97, second_player_answer_id: 97)
FactoryGirl.create(:round_question, round_id: 5, question_id: 24, first_player_answer_id: 95, second_player_answer_id: 93)

FactoryGirl.create(:round_question, round_id: 6, question_id: 10, first_player_answer_id: nil, second_player_answer_id: 37)
FactoryGirl.create(:round_question, round_id: 6, question_id: 9, first_player_answer_id: nil, second_player_answer_id: 36)
FactoryGirl.create(:round_question, round_id: 6, question_id: 2, first_player_answer_id: nil, second_player_answer_id: 5)
