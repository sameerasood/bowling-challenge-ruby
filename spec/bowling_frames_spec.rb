require('./bowling_frames')

RSpec.describe BowlingFrames do
  it 'gets first frame' do
    io = double :io
    frames = [
      { first_roll: 10, second_roll: 0 },
      { first_roll: 5, second_roll: 5 },
      { first_roll: 5, second_roll: 4 },
      { first_roll: 5, second_roll: 4 },
      { first_roll: 5, second_roll: 4 },
      { first_roll: 5, second_roll: 4 },
      { first_roll: 5, second_roll: 4 },
      { first_roll: 5, second_roll: 4 },
      { first_roll: 5, second_roll: 4 },
      { first_roll: 5, second_roll: 4 }
    ]
    frames.each do |roll|
      expect(io).to receive(:puts).with('Enter first strike').ordered
      expect(io).to receive(:gets).and_return(roll[:first_roll].to_s).ordered

      if roll[:first_roll] < 10
        expect(io).to receive(:puts).with('Enter second strike').ordered
        expect(io).to receive(:gets).and_return(roll[:second_roll].to_s).ordered
      end
    end

    strike = BowlingFrames.new(io)
    expect(strike.run).to eq(107)
  end
end
