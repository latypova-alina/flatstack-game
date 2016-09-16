require "csv"

2.times { FactoryGirl.create :user }

FactoryGirl.create :user, :administrator
FactoryGirl.create :user, :bot

CSV.foreach("db/seeds/questions.csv", headers: true, header_converters: :symbol) do |row|
  row = row.to_hash

  category = Category.find_or_create_by name: row[:category]

  next if Question.where(question: row[:question]).any?

  question = Question.create(question: row[:question], category: category)

  question.answers.create(answer: row[:right_answer], truthy: 1)
  question.answers.create(answer: row[:wrong_answer_1], truthy: 0)
  question.answers.create(answer: row[:wrong_answer_2], truthy: 0)
  question.answers.create(answer: row[:wrong_answer_3], truthy: 0)
end
