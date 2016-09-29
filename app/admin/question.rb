ActiveAdmin.register Question do
  permit_params :question, answers_attributes: %i(answer_variant truthy)

  form do |f|
    f.inputs "Вопрос" do
      f.input :question
      f.inputs do
        f.has_many :answer_variants, heading: "Ответы", new_record: "Добавить вариант ответа" do |b|
          b.input :answer_variant
          b.input :truthy
        end
      end
    end
    f.actions
  end
end
