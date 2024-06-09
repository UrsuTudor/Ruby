require './lib/game'

describe Game do
  subject(:game) { described_class.new }

  describe 'display_game' do
    before do
      allow(game.instance_variable_get(:@board)).to receive(:each)
    end

    it 'displays the arrays of the game in the console' do
      expect(game.instance_variable_get(:@board)).to receive(:each).once
      game.display_board
    end
  end

  describe 'place_color' do
    context 'when use input is (1, 1)' do
      it 'changes the first element of the first row' do
        board = game.instance_variable_get(:@board)
        expect(game).to receive(:gets).and_return('1, 1')
        game.place_color
        expect(board[0][0]).to be_instance_of(Space)
      end

      it 'changes the first element of the first row to a #Space belonging to red if the round is 0' do
        board = game.instance_variable_get(:@board)
        game.round = 0
        expect(game).to receive(:gets).and_return('1, 1')
        game.place_color
        expect(board[0][0].instance_variable_get(:@player)).to eq('r')
      end

      it 'changes the first element of the first row to a #Space belonging to red if the round is even' do
        board = game.instance_variable_get(:@board)
        game.round = 2
        expect(game).to receive(:gets).and_return('1, 1')
        game.place_color
        expect(board[0][0].instance_variable_get(:@player)).to eq('r')
      end

      it 'changes the first element of the first row to a #Space belonging to yellow if the round is odd' do
        board = game.instance_variable_get(:@board)
        game.round = 3
        expect(game).to receive(:gets).and_return('1, 1')
        game.place_color
        expect(board[0][0].instance_variable_get(:@player)).to eq('y')
      end
    end
  end

  describe 'out_of_bounds?' do
    it 'returns false when called with 1, 1' do
      expect(game.out_of_bounds?([1, 1])).to be(false)
    end

    it 'returns true when called with 7, 7' do
      expect(game.out_of_bounds?([7, 7])).to be(true)
    end
  end

  describe 'occupied?' do
    before do
      allow(game).to receive(:gets).and_return('1, 1')
      game.place_color
    end

    it 'returns true if the chosen space is already occupied' do
      expect(game.occupied?([0, 0])).to be(true)
    end

    it 'returns false if the chosen space is not occupied' do
      expect(game.occupied?([0, 1])).to be(false)
    end
  end

  describe 'no_foundation?' do
    before do
      allow(game).to receive(:gets).and_return('1, 1')
      game.place_color
    end

    it 'returns true if the space below the selected one is not occupied' do
      expect(game.no_foundation?([2, 6])).to be(true)
    end

    it 'returns false if the space below the selected one is occupied' do
      expect(game.no_foundation?([0, 2])).to be(false)
    end
  end
end
