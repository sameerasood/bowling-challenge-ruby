require './bowling_scorecard'

RSpec.describe Bowling do
    it "gets first frame" do
    io = double :io
    expect(io).to receive(:puts).with("Enter first strike")
    expect(io).to receive(:gets).and_return('6')
    expect(io).to receive(:puts).with("Enter second strike")
    expect(io).to receive(:gets).and_return('3')
    strike = Bowling.new(io)
    strike.run
  end
end