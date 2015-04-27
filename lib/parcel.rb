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
    if self.shipping_size == "large"
      return @weight * 2.00
    elsif self.shipping_size == "medium"
      return @weight * 1.50
    else
      return @weight * 1.00
    end
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
