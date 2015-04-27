require('rspec')
require('parcel')
require('pry')

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
    expect(parcel1.cost_to_ship()).to(eq(20.0))
  end

  it('calculate cost of shipping LARGE package given package size and weight') do
    parcel1 = Parcel.new(36, 4, 4, 40)
    expect(parcel1.cost_to_ship()).to(eq(80.0))
  end

  it('calculate cost of shipping OVERNIGHT priority') do
    parcel1 = Parcel.new(36, 4, 4, 40)
    expect(parcel1.cost_to_ship("overnight")).to(eq(160.0))
  end

  it('calculate cost of shipping TWODAY priority') do
    parcel1 = Parcel.new(36, 4, 4, 40)
    expect(parcel1.cost_to_ship("twoday")).to(eq(120.0))
  end

  it('calculate cost of shipping internationally') do
    parcel1 = Parcel.new(36, 4, 4, 40)
    expect(parcel1.cost_to_ship("twoday", "international")).to(eq(240.0))
  end

end

describe('Parcel#shipping_size') do
  it('calculate package size for use in shipping cost calculation') do
    #small
    parcel1 = Parcel.new(4, 4, 4, 20)
    expect(parcel1.shipping_size()).to(eq("small"))
    #medium
    parcel2 = Parcel.new(8, 8, 8, 20)
    expect(parcel2.shipping_size()).to(eq("medium"))
    #large
    parcel3 = Parcel.new(24, 24, 24, 20)
    expect(parcel3.shipping_size()).to(eq("large"))
  end
end
