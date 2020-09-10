require 'journey_log'
#require 'journey'

describe JourneyLog do

  it 'initializes with a new instance of Journey' do
    j = JourneyLog.new
    expect(j.journey).to be_an_instance_of Journey
  end

  it "starts a new journey with an entry station" do
    j = JourneyLog.new
    expect(j.start("bow_road")).to eq("bow_road")
  end

  it "returns incomplete journey" do
    trip = JourneyLog.new
    trip.start("Waterloo")
    expect(trip.current_journey).to include("Waterloo")
  end

end
