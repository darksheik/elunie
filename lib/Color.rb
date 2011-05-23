class Color
  attr_accessor :color
  # List of colors
  @@colors = ["yellow","blue"]

  # Argument is optional, will pick one at random from the array otherwise
  def initialize(*c)
    if !c[0] then @color = pick_color else @color = c[0] end
  end
  def pick_color
    @@colors[rand(@@colors.size)]
  end
  def to_s
    @color
  end
end

