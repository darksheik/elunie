require_relative 'Color'
require_relative 'Figure'
require_relative 'Size'

class Agent
  def initialize(*scf)  # Should be in size, color, figure order
      @agent = { :size => Size.new(scf[0]), :color => Color.new(scf[1]), :figure => Figure.new(scf[2]) }
  end


  # Accessor method for the instance variable
  def agent
    @agent
  end

  # Making it look pretty for the front end
  def to_s
    @agent[:size].to_s + " " + @agent[:color].to_s + " " + @agent[:figure].to_s
  end
end
