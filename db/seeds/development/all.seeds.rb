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

FactoryGirl.create(:player_answer, user_id: 5, question_id: 17, answer_variant_id: 66, truthy: FALSE)
FactoryGirl.create(:player_answer, user_id: 5, question_id: 21, answer_variant_id: 81, truthy: TRUE)
FactoryGirl.create(:player_answer, user_id: 5, question_id: 12, answer_variant_id: 45, truthy: TRUE)

FactoryGirl.create(:player_answer, user_id: 7, question_id: 17, answer_variant_id: 66, truthy: FALSE)
FactoryGirl.create(:player_answer, user_id: 7, question_id: 21, answer_variant_id: 81, truthy: TRUE)
FactoryGirl.create(:player_answer, user_id: 7, question_id: 12, answer_variant_id: 46, truthy: FALSE)

FactoryGirl.create(:player_answer, user_id: 7, question_id: 61, answer_variant_id: 241, truthy: TRUE)
FactoryGirl.create(:player_answer, user_id: 7, question_id: 62, answer_variant_id: 245, truthy: TRUE)
FactoryGirl.create(:player_answer, user_id: 7, question_id: 65, answer_variant_id: 257, truthy: TRUE)

FactoryGirl.create(:player_answer, user_id: 5, question_id: 61, answer_variant_id: 241, truthy: TRUE)
FactoryGirl.create(:player_answer, user_id: 5, question_id: 62, answer_variant_id: 246, truthy: FALSE)
FactoryGirl.create(:player_answer, user_id: 5, question_id: 65, answer_variant_id: 257, truthy: TRUE)

FactoryGirl.create(:player_answer, user_id: 5, question_id: 203, answer_variant_id: 810, truthy: FALSE)
FactoryGirl.create(:player_answer, user_id: 5, question_id: 198, answer_variant_id: 792, truthy: FALSE)
FactoryGirl.create(:player_answer, user_id: 5, question_id: 194, answer_variant_id: 774, truthy: FALSE)

FactoryGirl.create(:player_answer, user_id: 7, question_id: 203, answer_variant_id: 809, truthy: TRUE)
FactoryGirl.create(:player_answer, user_id: 7, question_id: 198, answer_variant_id: 792, truthy: FALSE)
FactoryGirl.create(:player_answer, user_id: 7, question_id: 194, answer_variant_id: 773, truthy: TRUE)

FactoryGirl.create(:player_answer, user_id: 5, question_id: 176, answer_variant_id: 701, truthy: TRUE)

FactoryGirl.create(:player_answer, user_id: 6, question_id: 35, answer_variant_id: 137, truthy: TRUE)
FactoryGirl.create(:player_answer, user_id: 6, question_id: 25, answer_variant_id: 97, truthy: TRUE)
FactoryGirl.create(:player_answer, user_id: 6, question_id: 24, answer_variant_id: 95, truthy: FALSE)

FactoryGirl.create(:player_answer, user_id: 5, question_id: 35, answer_variant_id: 139, truthy: FALSE)
FactoryGirl.create(:player_answer, user_id: 5, question_id: 25, answer_variant_id: 97, truthy: TRUE)
FactoryGirl.create(:player_answer, user_id: 5, question_id: 24, answer_variant_id: 93, truthy: TRUE)

FactoryGirl.create(:player_answer, user_id: 5, question_id: 10, answer_variant_id: 37, truthy: TRUE)
FactoryGirl.create(:player_answer, user_id: 5, question_id: 9, answer_variant_id: 36, truthy: FALSE)
FactoryGirl.create(:player_answer, user_id: 5, question_id: 2, answer_variant_id: 5, truthy: TRUE)

FactoryGirl.create(:round_question, round_id: 1, question_id: 17, first_player_answer_id: 1, second_player_answer_id: 4)
FactoryGirl.create(:round_question, round_id: 1, question_id: 21, first_player_answer_id: 2, second_player_answer_id: 5)
FactoryGirl.create(:round_question, round_id: 1, question_id: 12, first_player_answer_id: 3, second_player_answer_id: 6)

FactoryGirl.create(:round_question, round_id: 2, question_id: 61, first_player_answer_id: 10, second_player_answer_id: 7)
FactoryGirl.create(:round_question, round_id: 2, question_id: 62, first_player_answer_id: 11, second_player_answer_id: 8)
FactoryGirl.create(:round_question, round_id: 2, question_id: 65, first_player_answer_id: 12, second_player_answer_id: 9)

FactoryGirl.create(:round_question, round_id: 3, question_id: 203, first_player_answer_id: 13, second_player_answer_id: 16)
FactoryGirl.create(:round_question, round_id: 3, question_id: 198, first_player_answer_id: 14, second_player_answer_id: 17)
FactoryGirl.create(:round_question, round_id: 3, question_id: 194, first_player_answer_id: 15, second_player_answer_id: 18)

FactoryGirl.create(:round_question, round_id: 4, question_id: 176, first_player_answer_id: 19, second_player_answer_id: nil)
FactoryGirl.create(:round_question, round_id: 4, question_id: 179, first_player_answer_id: nil, second_player_answer_id: nil)
FactoryGirl.create(:round_question, round_id: 4, question_id: 180, first_player_answer_id: nil, second_player_answer_id: nil)

FactoryGirl.create(:round_question, round_id: 5, question_id: 35, first_player_answer_id: 20, second_player_answer_id: 23)
FactoryGirl.create(:round_question, round_id: 5, question_id: 25, first_player_answer_id: 21, second_player_answer_id: 24)
FactoryGirl.create(:round_question, round_id: 5, question_id: 24, first_player_answer_id: 22, second_player_answer_id: 25)

FactoryGirl.create(:round_question, round_id: 6, question_id: 10, first_player_answer_id: nil, second_player_answer_id: 26)
FactoryGirl.create(:round_question, round_id: 6, question_id: 9, first_player_answer_id: nil, second_player_answer_id: 27)
FactoryGirl.create(:round_question, round_id: 6, question_id: 2, first_player_answer_id: nil, second_player_answer_id: 28)
