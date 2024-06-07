require './lib/game'

describe Game do
  subject(:board) { described_class.new }

  before do
    allow(board.instance_variable_get(:@board)).to receive(:each)
  end

  describe 'display_board' do
    it 'displays the arrays of the board in the console' do
      expect(board.instance_variable_get(:@board)).to receive(:each).once
      board.display_board
    end
  end
end
