require_relative 'cell'

class Board

  attr_accessor :cells_hash # can I do this for the dummy test?

  def initialize(cells_hash = {})
    @cells_hash = cells_hash
    grid_ref_array.each {|grid_ref| @cells_hash[grid_ref] = Cell.new}
  end

  def cells_hash
    @cells_hash
  end

  def grid_ref_array
    ('a'..'j').map { |letter| (1..10).map { |number| letter + number.to_s } }.flatten   
  end

  def place_ship_cell(grid_ref)
    raise "Not a valid cell" unless @cells_hash.has_key?(grid_ref)
    raise "Can't place ship twice in same cell" if @cells_hash[grid_ref].have_ship == true
    @cells_hash[grid_ref].is_part_of_a_ship
  end

  def place_all_ships(grid_ref_array)
    grid_ref_array.each do |grid_ref| 
      place_ship_cell(grid_ref)
    end
  end

  def shoot_at_cell(grid_ref)
    raise "Not a valid cell" unless @cells_hash.has_key?(grid_ref)
    raise "Already shot - choose another" if @cells_hash[grid_ref].hit == true
    @cells_hash[grid_ref].has_been_hit
  end
end

           