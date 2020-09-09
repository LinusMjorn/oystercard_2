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

  describe '#fare - with exit station' do
    before do
      subject.finish(station)
    end
  
    it "should respond to the #fare method" do
      expect(subject).to respond_to(:fare)
    end

    it "should return the minimum fare if there is an exit && entry station" do
      journey = Journey.new("station1")
      journey.finish(station)
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end
  end

  describe '#fare - without either entry or exit station' do
    it "should return PENALTY_FARE [6] if no entry or exit station set" do
      journey = Journey.new()
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    it "should return PENALTY fare if only one station (entry)" do
      journey = Journey.new("station1")
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    it "should return PENALTY fare if only one station (exit)" do
      journey = Journey.new()
      journey.finish("station1")
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end

  describe '#complete?' do
     it "should return true if a journey has both entry and exit stations" do
      journey = Journey.new("station1")
      journey.finish(station)
      expect(journey.complete?).to eq true
    end

    it "should return false if a journey has no entry or exit station" do
    expect(subject.complete?).to eq false
    end
  end

end
