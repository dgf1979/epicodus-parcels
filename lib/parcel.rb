#Parcel class
class Parcel
  #init parcel
  define_method(:initialize) do |length, width, height, weight|
    @length = length
    @width = width
    @height = height
    @weight = weight
  end

  #calc volume from dimensions
  define_method(:volume) do
    return @length * @width * @height
  end

  define_method(:cost_to_ship) do |priority = ""|
    base_charge = 0
    if self.shipping_size == "large"
      base_charge = @weight * 2.00
    elsif self.shipping_size == "medium"
      base_charge = @weight * 1.50
    else
      base_charge = @weight * 1.00
    end
    if priority == "overnight"
      base_charge = base_charge * 2
    end
    base_charge
  end

  define_method(:shipping_size) do
    if @length >= 24 || @width >= 24 || @height >= 24
      return "large"
    elsif @length >= 8 || @width >= 8 || @height >= 8
      return "medium"
    else
      return "small"
    end

  end

end
