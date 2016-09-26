FactoryGirl.define do
  factory :game do
    association :first_player, factory: :user
    association :second_player, factory: :user
    state "in_progress"

    after(:create) do |item|
      round_1 = create(:round, game_id: item.id, category_id: 2)
      round_2 = create(:round, game_id: item.id, category_id: 6)
      round_3 = create(:round, game_id: item.id, category_id: 17)

      player_answer_1 = create(:player_answer, game_id: item.id, user_id: 5, question_id: 17, answer_variant_id: 66, truthy: false)
      player_answer_2 = create(:player_answer, game_id: item.id, user_id: 5, question_id: 21, answer_variant_id: 81, truthy: true)
      player_answer_3 = create(:player_answer, game_id: item.id, user_id: 5, question_id: 12, answer_variant_id: 45, truthy: true)

      player_answer_4 = create(:player_answer, game_id: item.id, user_id: 7, question_id: 17, answer_variant_id: 66, truthy: false)
      player_answer_5 = create(:player_answer, game_id: item.id, user_id: 7, question_id: 21, answer_variant_id: 81, truthy: true)
      player_answer_6 = create(:player_answer, game_id: item.id, user_id: 7, question_id: 12, answer_variant_id: 46, truthy: false)

      player_answer_7 = create(:player_answer, game_id: item.id, user_id: 7, question_id: 61, answer_variant_id: 241, truthy: true)
      player_answer_8 = create(:player_answer, game_id: item.id, user_id: 7, question_id: 62, answer_variant_id: 245, truthy: true)
      player_answer_9 = create(:player_answer, game_id: item.id, user_id: 7, question_id: 65, answer_variant_id: 257, truthy: true)

      player_answer_10 = create(:player_answer, game_id: item.id, user_id: 5, question_id: 61, answer_variant_id: 241, truthy: true)
      player_answer_11 = create(:player_answer, game_id: item.id, user_id: 5, question_id: 62, answer_variant_id: 246, truthy: false)
      player_answer_12 = create(:player_answer, game_id: item.id, user_id: 5, question_id: 65, answer_variant_id: 257, truthy: true)

      player_answer_13 = create(:player_answer, game_id: item.id, user_id: 5, question_id: 203, answer_variant_id: 810, truthy: false)
      player_answer_14 = create(:player_answer, game_id: item.id, user_id: 5, question_id: 198, answer_variant_id: 792, truthy: false)
      player_answer_15 = create(:player_answer, game_id: item.id, user_id: 5, question_id: 194, answer_variant_id: 774, truthy: false)

      player_answer_16 = create(:player_answer, game_id: item.id, user_id: 7, question_id: 203, answer_variant_id: 809, truthy: true)
      player_answer_17 = create(:player_answer, game_id: item.id, user_id: 7, question_id: 198, answer_variant_id: 792, truthy: false)
      player_answer_18 = create(:player_answer, game_id: item.id, user_id: 7, question_id: 194, answer_variant_id: 773, truthy: true)

      create(:round_question,
        round_id: round_1.id,
        question_id: 17,
        first_player_answer_id: player_answer_1.id,
        second_player_answer_id: player_answer_4.id)
      create(:round_question,
        round_id: round_1.id,
        question_id: 21,
        first_player_answer_id: player_answer_2.id,
        second_player_answer_id: player_answer_5.id)
      create(:round_question,
        round_id: round_1.id,
        question_id: 12,
        first_player_answer_id: player_answer_3.id,
        second_player_answer_id: player_answer_6.id)

      create(:round_question,
        round_id: round_2.id,
        question_id: 61,
        first_player_answer_id: player_answer_10.id,
        second_player_answer_id: player_answer_7.id)
      create(:round_question,
        round_id: round_2.id,
        question_id: 62,
        first_player_answer_id: player_answer_11.id,
        second_player_answer_id: player_answer_8.id)
      create(:round_question,
        round_id: round_2.id,
        question_id: 65,
        first_player_answer_id: player_answer_12.id,
        second_player_answer_id: player_answer_9.id)

      create(:round_question,
        round_id: round_3.id,
        question_id: 203,
        first_player_answer_id: player_answer_13.id,
        second_player_answer_id: player_answer_16.id)
      create(:round_question,
        round_id: round_3.id,
        question_id: 198,
        first_player_answer_id: player_answer_14.id,
        second_player_answer_id: player_answer_17.id)
      create(:round_question,
        round_id: round_3.id,
        question_id: 194,
        first_player_answer_id: player_answer_15.id,
        second_player_answer_id: player_answer_18.id)
    end
  end

  trait :in_progress do
    state "in_progress"
  end

  trait :finished do
    state "finished"
  end

  trait :player_5_vs_player_7 do
    first_player_id 5
    second_player_id 7
    winner_id 7
  end
end
