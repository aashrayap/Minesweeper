require 'game'

describe Game do
	let(:g){Game.new}
	describe '#intro' do
	  it 'displays starting messages' do
	  	expect(g).to receive(:intro)
	  	g.intro
	  end
	end

	describe '#select_difficulty' do
	  it 'creates appropriate difficulty' do
	    allow(g.select_difficulty).to receive(:game_mode).and_return(Board.new(9,9,10))
	    expect(g.board).to eq(nil)
	  end
	end
end