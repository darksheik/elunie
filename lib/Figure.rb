class Figure
  attr_accessor :figure
  # List of figures
  @@figures = ["circle","lozenge"]

  # Argument is optional, will pick one at random from the array otherwise
  def initialize(*f)
    if !f[0] then @figure = pick_figure else @figure = f[0] end
  end
  def pick_figure
    @@figures[rand(@@figures.size)]
  end
  def to_s
    @figure 
  end
end

