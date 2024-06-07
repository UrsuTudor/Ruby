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

      it 'loops if the space is already occupied' do
        board = game.instance_variable_get(:@board)
        expect(game).to receive(:gets).and_return('1, 1')
        game.place_color
        expect(game).to receive(:gets).and_return('1, 1')
        expect(game).to receive(:puts).with('Please select an empty space.').twice
        expect(game).to receive(:puts).with('That space is already occupied.')
        expect(game).to receive(:gets).and_return('1, 2')
        game.place_color
      end
    end
  end
end
