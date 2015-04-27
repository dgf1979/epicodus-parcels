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

end
