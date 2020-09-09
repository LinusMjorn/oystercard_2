require 'station'

describe Station do

  it "checks that there is a name and zone variable" do
    station = Station.new("Old Street", 1)
    expect(station.name).to eq("Old Street")
  end

  it "checks that there is a zone variable" do
    station = Station.new("Old Street", 1)
    expect(station.zone).to eq(1)
  end
end
