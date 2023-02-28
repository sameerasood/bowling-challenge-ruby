require('./bowling_score')
require('pry')

class 
  FRAMES_COUNT = 10
  STRIKE_BONUS = 10
BowlingFrames
  def initialize(io)
    @io = io
  end

  def run
    BowlingScore.new(frames).total
  end

  def frames
    FRAMES_COUNT.times.map do
      first_roll = roll_score_input('Enter first strike')
      second_roll = calculate_second_roll(first_roll)
      frame(first_roll, second_roll)
    end
  end

  def calculate_second_roll(first_roll)
    if strike?(first_roll)
      roll_score_input('Enter second strike')
    else
      0
    end
  end

  def strike?(first_roll)
    first_roll < 10
  end

  def roll_score_input(text)
    @io.puts text
    @io.gets.chomp.to_i
  end

  def frame(first_roll, second_roll)
    if strike?(first_roll)
      { first_roll: first_roll, second_roll: second_roll, bonus: STRIKE_BONUS }
    elsif first_roll + second_roll == 10
      { first_roll: first_roll, second_roll: second_roll, bonus: 5 }
    else
      { first_roll: first_roll, second_roll: second_roll, bonus: 0 }
    end
  end
end
