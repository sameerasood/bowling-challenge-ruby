class Bowling
  def initialize(io)
    @io = io
    @all_frames = []
    @each_frame = []
    @frames_num = 0
    @first_roll = 0
    @second_roll = 0
  end

  def run
    while @frames_num < 10 do
      roll_1
        if @first_roll == 10
        @frames_num += 1
        @all_frames << [10,0]
        else
        roll_2
        end
    end
  end

  def roll_1
    @io.puts "Enter first roll"
    @first_roll = @io.gets.chomp.to_i
    @each_frame.push(@first_roll)
  end

  def roll_2
    @io.puts "Enter second roll"
    @second_roll = @io.gets.chomp.to_i
    @each_frame.push(@second_roll)
    @all_frames << @each_frame
    @each_frame = []
    @frames_num += 1
  end
end

  def score
  total = 0
  frame_index = 0
  10.times do |frame_num|
    frame = @all_frames[frame_index]
    if frame[0] == 10 && frame_num < 9
      total += 10 + @all_frames[frame_index + 1][0] + @all_frames[frame_index + 1][1]
      frame_index += 1
    elsif frame[0] == 10 && frame_num == 9
      total += 10 + @all_frames[frame_index + 1][0] + @all_frames[frame_index + 1][1] + @all_frames[frame_index + 2][0]
      frame_index += 1
    elsif frame[0] + frame[1] == 10
      total += 10 + @all_frames[frame_index + 1][0]
      frame_index += 2
    else # open frame
      total += frame[0] + frame[1]
      frame_index += 1
    end
  end
  total
end

end




    strike = Bowling.new(Kernel)
    strike.run