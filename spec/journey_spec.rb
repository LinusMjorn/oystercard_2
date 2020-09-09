require 'journey'
require 'oystercard'

describe Journey do
  let(:station) { double :station, zone: 1}

  it 'initializes with an optional entry station' do
    journey = Journey.new("Old Street")
    expect(journey.entry_station).to eq "Old Street"
  end

  describe '#finish' do
    it 'should respond to the #finish method' do
      expect(subject).to respond_to(:finish)
    end
    it 'should set the exit station' do
        expect {subject.finish(station)}.to change{subject.exit_station}.from(nil).to(station)
    end
  end

  describe '#fare' do


  end

  describe '#complete?' do

  end

end
