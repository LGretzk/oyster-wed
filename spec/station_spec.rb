require './lib/station'

describe Station do
  let(:name){ double :name }
  let(:zone){ double :name }

  it 'initializes with a name' do
    station = Station.new(name, zone)
    expect(station.name).to eq name
  end

  it 'initializes wiht a zone' do
    station = Station.new(name, zone)
    expect(station.zone).to eq zone
  end

end
