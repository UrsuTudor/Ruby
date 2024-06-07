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
    context 'when called with (1, 1)' do
      it 'changes the first element of the first row' do
        board = game.instance_variable_get(:@board)
        game.place_color(1, 1)
        expect(board[0][0]).to be_instance_of(Space)
      end

      it 'changes the first element of the first row to a #Space belonging to red if the round is 0' do
        board = game.instance_variable_get(:@board)
        game.round = 0
        game.place_color(1, 1)
        expect(board[0][0].instance_variable_get(:@player)).to eq('r')
      end

      it 'changes the first element of the first row to a #Space belonging to red if the round is even' do
        board = game.instance_variable_get(:@board)
        game.round = 2
        game.place_color(1, 1)
        expect(board[0][0].instance_variable_get(:@player)).to eq('r')
      end

      it 'changes the first element of the first row to a #Space belonging to yellow if the round is odd' do
        board = game.instance_variable_get(:@board)
        game.round = 3
        game.place_color(1, 1)
        expect(board[0][0].instance_variable_get(:@player)).to eq('y')
      end

      it 'returns if the space is already occupied' do
        board = game.instance_variable_get(:@board)
        expect(game).to receive(:place_color).with(1, 1).and_return(board[0][0])
        game.place_color(1, 1)
        expect(game).to receive(:place_color).with(1, 1).and_return('That space is already occupied.')
        game.place_color(1, 1)
      end
    end
  end
end
