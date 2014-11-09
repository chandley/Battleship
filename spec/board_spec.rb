require 'board'


describe Board do
  context 'basic properties' do
    
    let(:cell) {double :cell, :is_a? => true }
    let(:board) {Board.new}

    it 'can contain something' do
      expect(board.cells_hash.first).not_to be_nil
    end

    it 'has a cell stored at grid ref a1' do
      expect(board.cells_hash['a1'].is_a?(Cell)).to be true
    end

    it "knows about an array which contains 'a1','b10','g8' & 'j10'" do
      expect(board.grid_ref_array).to include('a1','b10','g8','j10')
    end

    it 'grid ref array has 100 elements' do
      expect(board.grid_ref_array.size).to eq(100)
    end

    it 'cells hash must include 100 unique keys' do
      expect(board.cells_hash.keys.uniq.size).to eq(100)
    end

   it 'cells hash must include 100 unique values' do
      expect(board.cells_hash.values.uniq.size).to eq(100)
    end

    it "has a ship at a1 after ship placed at a1" do
      water = double :cell 
      dummy_board = Board.new
      dummy_board.cells_hash = { 'a1' => water }
      expect(water).to receive(:is_part_of_a_ship)
      dummy_board.place_ship_cell('a1')
    end

    it "has a ship at a1 after being passed ship array containing 'a1'" do
      water = double :cell 
      dummy_board = Board.new
      dummy_board.cells_hash = { 'a1' => water }
      expect(water).to receive(:is_part_of_a_ship)
      dummy_board.place_all_ships(['a1'])
    end

    it "should receive a shot at a1" do
      water = double :cell
      dummy_board = Board.new
      dummy_board.cells_hash = {'a1'=> water}
      expect(water).to receive(:has_been_hit)
      dummy_board.shoot_at_cell('a1')
    end

    it 'should raise an error if ship place at invalid grid ref' do
      expect(lambda{board.place_ship_cell('a13')}).to raise_error(RuntimeError)
    end

    it 'should raise error if shot at invalid grid ref' do
      expect(lambda{board.shoot_at_cell('a13')}).to raise_error(RuntimeError)
    end
  end
end

#Change is to become