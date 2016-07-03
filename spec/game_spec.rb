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
	  	difficulty=double('difficulty')
	    allow(g.select_difficulty).to receive(:difficulty).and_return('1')
	    expect(g.select_difficulty)
	    g.select_difficulty
	  end
	end
end