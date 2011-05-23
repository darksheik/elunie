class Size
  attr_accessor :size
  # List of sizes
  @@sizes = ["small","big"]

  # Argument is optional, will pick one at random from the array otherwise
  def initialize(*s)
    if !s[0] then @size = pick_size else @size = s[0] end
  end

  def pick_size
    @@sizes[rand(@@sizes.size)]
  end
  def to_s
    @size
  end
end

