require 'game'

describe Game do
	let(:g){Game.new}
	describe '#intro' do
	  it 'displays starting messages' do
	  	expect(g).to receive(:intro)
	  	g.intro
	  end
	end
end