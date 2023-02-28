class BowlingScore
  def initialize(frames)
    @frames = frames
  end

  def total
    @frames.sum { |roll| roll[:first_roll] + roll[:second_roll] + roll[:bonus] }
  end
end
