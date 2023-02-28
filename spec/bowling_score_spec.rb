require './bowling_score'

RSpec.describe 'BowlingScore' do
  it 'returns a number' do
    frames = [
      { first_roll: 10, second_roll: 0, bonus: 10 },
      { first_roll: 5, second_roll: 5, bonus: 5 },
      { first_roll: 5, second_roll: 4, bonus: 0 },
      { first_roll: 5, second_roll: 4, bonus: 0 },
      { first_roll: 5, second_roll: 4, bonus: 0 },
      { first_roll: 5, second_roll: 4, bonus: 0 },
      { first_roll: 5, second_roll: 4, bonus: 0 },
      { first_roll: 5, second_roll: 4, bonus: 0 },
      { first_roll: 5, second_roll: 4, bonus: 0 },
      { first_roll: 5, second_roll: 4, bonus: 0 }
    ]
    score = BowlingScore.new(frames)

    score_total = score.total

    expect(score_total).to eq(107)
  end
end
