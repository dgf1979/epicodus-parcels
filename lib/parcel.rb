#Parcel class
class Parcel
  #init parcel
  define_method(:initialize) do |length, width, height, weight|
    @length = length.to_i()
    @width = width.to_i()
    @height = height.to_i()
    @weight = weight.to_i()
    @gift_wrap_cost = 0
  end

  #calc volume from dimensions
  define_method(:volume) do
    return @length * @width * @height
  end

  define_method(:cost_to_ship) do |priority = "", destination = ""|
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
    elsif priority == "twoday"
      base_charge = base_charge * 1.5
    end
    if destination == "international"
      base_charge = base_charge * 2
    end
    base_charge + @gift_wrap_cost
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

  define_method(:gift_wrap) do |bool=false|
    if bool == true
      @gift_wrap_cost = @length * @width * 2 +
      @length * @height * 2 +
      @width * @height * 2
    end
    @gift_wrap_cost = @gift_wrap_cost.*(0.1).round(2)
  end

end
