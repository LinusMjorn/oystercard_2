require 'journey_log'
#require 'journey'

describe JourneyLog do 

  it 'initializes with a new instance of Journey' do 
    j = JourneyLog.new
    expect(j.journey).to be_an_instance_of Journey
  end

end