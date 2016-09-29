require "csv"

2.times { FactoryGirl.create :user }

FactoryGirl.create :user, :administrator
FactoryGirl.create :user, :bot

CSV.foreach("db/seeds/questions.csv", headers: true, header_converters: :symbol) do |row|
  line = row
  row = row.to_hash

  category = Category.find_or_create_by name: row[:category]

  next if Question.where(question: row[:question]).any?

  question = Question.new(question: row[:question], category: category)

  next unless question.save

  question.answer_variants.create(answer: row[:right_answer], truthy: true)
  question.answer_variants.create(answer: row[:wrong_answer_1], truthy: false)
  question.answer_variants.create(answer: row[:wrong_answer_2], truthy: false)
  question.answer_variants.create(answer: row[:wrong_answer_3], truthy: false)
end
