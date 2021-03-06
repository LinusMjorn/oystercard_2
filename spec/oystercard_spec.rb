require 'oystercard.rb'

describe Oystercard do

  let(:oyster)            {   Oystercard.new  }
  let(:liverpool_street)  { "liverpool_street"  }
  let(:bow_road)          { "bow_road"   }

  it  "checks that the balance of oyster card is equal to the defualt" do
  expect(oyster.balance).to eq (15)
  end

  it "checks that you can top up the card with a specific value" do
  expect {oyster.top_up(10)}.to change{oyster.balance}.by 10
  end

  it "sends an error message if the card is topped up with more than £90" do
    expect {oyster.top_up(76)}.to raise_error "Limit is £90"
  end

  it "checks that you can deduct money from the balance" do
    expect {oyster.touch_out(bow_road, 10)}.to change{oyster.balance}.by -10
  end

  describe 'touch_in' do
    #CHANGE
    it "checks that the oyster card has been touched in" do
      oyster.touch_in(liverpool_street)
      expect(oyster.in_journey?).to eq true
    end

    it 'won\'t allow me to touch in if the balance is less than £1' do
      cloyster = Oystercard.new(0)
      expect { cloyster.touch_in(liverpool_street) }.to raise_error "Minimum fare is £1"
    end
    #CHANGE
    it 'remembers the station it touched in at' do
      oyster.touch_in(liverpool_street)
      expect(oyster.entry_station).to eq liverpool_street
    end
  end

  describe 'touch out' do
    #CHANGE
    it "checks that the oyster card has been touched out" do
      oyster.touch_in(liverpool_street)
      oyster.touch_out(bow_road)
      expect(oyster.in_journey?).to eq false
    end

    it "checks that the balance has been deducted by the minimum fare" do
      oyster.touch_in(liverpool_street)
      expect { oyster.touch_out(bow_road, Oystercard::MINIMUM_FARE) }.to change{oyster.balance}.by -Oystercard::MINIMUM_FARE
    end
    #CHANGE
    it 'forgets the entry station when it touches out' do
      oyster.touch_in(liverpool_street)
      oyster.touch_out(bow_road)
      expect(oyster.entry_station).to eq nil
    end
  end

  #CHANGE
    it "checks that the history variable has data added to it" do
      subject.touch_in(liverpool_street)
      subject.touch_out(bow_road)
      expect(subject.history).to eq [{ liverpool_street => bow_road }]

    end

  describe "Journey history" do
    it "checks that the journey history hash is empty by default" do
      expect(subject.history).to eq []
    end
  end
end
