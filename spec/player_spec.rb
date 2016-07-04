require 'player'

	describe Player do
		let(:p){Player.new('Ash')}
		describe '#initialize' do
		  it 'properly gets name of player' do
		  	expect(p.name).to eq('Ash')
		end
	end

	describe '#coordinates' do
		it 'properly recieves a coordinate'do
		  expect(p).to receive(:get_coord)
		  p.coordinates
		end
	end
end