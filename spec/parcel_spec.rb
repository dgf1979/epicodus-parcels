require('rspec')
require('parcel')

describe('Parcel#new') do
  it('verifies that correct object is returned') do
    expect(Parcel.new(4, 4, 4, 20).class()).to(eq(Parcel))
  end
end

describe('Parcel#volume') do
  it('verifies that the expect volume measurement is returned') do
    parcel1 = Parcel.new(4, 4, 4, 20)
    expect(parcel1.volume()).to(eq(64))
  end
end

describe('Parcel#cost_to_ship') do
  it('calculate cost of shipping given weight times 1.5') do
    parcel1 = Parcel.new(4, 4, 4, 20)
    expect(parcel1.cost_to_ship()).to(eq(30))
  end

describe('Parcel#shipping_size')
  it('calculate package size for use in shipping cost calculation') do
    parcel1 = Parcel.new(4, 4, 4, 20)
    expect(parcel1.shipping_size()).to(eq("small"))
  end
  
end
