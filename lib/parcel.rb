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

  define_method(:cost_to_ship) do
    @weight * 1.5
  end

  define_method(:shipping_size) do
    if @length <= 6 && @width <= 6 && @height <= 6
      return "small"
    else
      return "other than small"
    end

  end

end
