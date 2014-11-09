class Cell
  attr_accessor :have_ship, :hit

  def initialize 
    @have_ship, @hit = false, false
  end

  def is_part_of_a_ship
    @have_ship = true
  end

  def has_been_hit
    @hit = true
  end

end