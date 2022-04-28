require 'journey'

describe Journey do

let(:entry_station){ double :entry_station }
let(:entry_station){ double :exit_station }
 
  it 'can create new journeys' do
    expect(subject).to be_an_instance_of(Journey)
  end 

  xit 'knows what station it started it\'s journey at' do
    expect(subject.entry_station).to eq 'Embankment'
  end 

  it 'responds to add station' do
    expect(subject).to respond_to(:add_entry_station).with(1).argument 
  end 

  it 'adds entry station' do
    expect(subject.add_entry_station(:entry_station)).to eq :entry_station
  end

  it 'adds exit station' do
    expect(subject.add_exit_station(:exit_station)).to eq :exit_station
  end

  it 'creates a hash with the journey' do
    subject.add_entry_station(:entry_station)
    subject.add_exit_station(:exit_station)
    expect(subject.journey_hash).to eq ({in: :entry_station, out: :exit_station})
  end



end 