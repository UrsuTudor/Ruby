require './lib/game'

describe Game do
  subject(:game) { described_class.new }

  describe 'place_color' do
    context 'when user input is (1, 1)' do
      it 'changes the first element of the first row' do
        board = game.instance_variable_get(:@board)
        game.place_color([0, 0])
        expect(board[0][0]).to eq('r')
      end

      it 'changes the first element of the first row to a #Space belonging to red if the round is 0' do
        board = game.instance_variable_get(:@board)
        game.round = 0
        game.place_color([0, 0])
        expect(board[0][0]).to eq('r')
      end

      it 'changes the first element of the first row to a #Space belonging to red if the round is even' do
        board = game.instance_variable_get(:@board)
        game.round = 2
        game.place_color([0, 0])
        expect(board[0][0]).to eq('r')
      end

      it 'changes the first element of the first row to a #Space belonging to yellow if the round is odd' do
        board = game.instance_variable_get(:@board)
        game.round = 3
        game.place_color([0, 0])
        expect(board[0][0]).to eq('y')
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
      game.place_color([0, 0])
    end

    it 'returns true if the chosen space is already occupied' do
      expect(game.occupied?([0, 0])).to be(true)
    end

    it 'returns false if the chosen space is not occupied' do
      expect(game.occupied?([0, 1])).to be(false)
    end
  end

  describe 'missing_input?' do
    it 'returns true if input or part of input is nil' do
      expect(game.missing_input?(nil)).to be(true)
      expect(game.missing_input?([0, nil])).to be(true)
    end

    it 'returns false if no part of input is nil' do
      expect(game.missing_input?([0, 1])).to be(false)
    end
  end

  describe 'no_foundation?' do
    before do
      game.place_color([0, 0])
    end

    it 'returns true if the space below the selected one is not occupied' do
      expect(game.no_foundation?([2, 6])).to be(true)
    end

    it 'returns false if the space below the selected one is occupied' do
      expect(game.no_foundation?([0, 2])).to be(false)
    end
  end

  describe 'row_win?' do
    before do
      game.place_color([0, 0])
      game.place_color([0, 1])
      game.place_color([0, 2])
      game.place_color([0, 3])
    end

    it 'returns true if there are 4 elements of the same type coming one after another in a row' do
      space = [0, 3]
      expect(game.row_win?(space)).to be(true)
    end

    it 'returns false if there are not 4 elements of the same type coming one after another in a row' do
      space = [0, 4]
      expect(game.row_win?(space)).to be(false)
    end
  end

  describe 'column_win?' do
    before do
      game.place_color([0, 0])
      game.place_color([1, 0])
      game.place_color([2, 0])
      game.place_color([3, 0])
    end

    it 'returns true if there are 4 elements of the same type coming one after another in a column' do
      space = [3, 0]
      expect(game.column_win?(space)).to be(true)
    end

    it 'returns false if there are not 4 elements of the same type coming one after another in a column' do
      space = [4, 0]
      expect(game.column_win?(space)).to be(false)
    end
  end

  describe 'diagonal_win?' do
    before do
      game.place_color([0, 0])
      game.place_color([0, 1])
      game.place_color([0, 2])
      game.place_color([0, 3])
      game.place_color([1, 1])
      game.place_color([1, 2])
      game.place_color([1, 3])
      game.place_color([2, 2])
      game.place_color([2, 3])
      game.place_color([3, 3])
    end

    it 'returns true if there are 4 elements of the same type in a diagonal' do
      space = [3, 3]
      expect(game.diagonal_win?(space)).to be(true)
    end

    it 'returns false if there are not 4 elements of the same type in a diagonal' do
      space = [5, 5]
      expect(game.diagonal_win?(space)).to be(false)
    end
  end

  describe 'tie?' do
    before do
      row = 0
      column = 0
      until row == 6
        column = 0
        until column == 6
          game.place_color([row, column])
          column += 1
        end
        row += 1
      end
    end

    it 'returns true if all spaces are occupied' do
      game.place_color([0, 6])
      game.place_color([1, 6])
      game.place_color([2, 6])
      game.place_color([3, 6])
      game.place_color([4, 6])
      game.place_color([5, 6])

      expect(game.tie?).to be(true)
    end

    it 'returns false if there is at least one empty space left' do
      expect(game.tie?).to be(false)
    end
  end
end
