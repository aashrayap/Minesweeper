require './player'
require 'pry'
require './cell'
class Board

	def initialize(rows,columns,mines)
		cell=0
		@board = Array.new(rows){Array.new(columns)}
		@board.each_with_index do |rowstuff,row|
			@board[row].each_with_index do |colstuff,column|
				@board[row][column]=Cell.new(row,column,'blank')
			end
		end

		mines.times do
           randomizer = @board.sample.sample
           if randomizer.cellmarker=='bomb'
                redo
           else randomizer.cellmarker='bomb'
          end
        end
	end
	
	def render
		puts "------- Minesweeper -------"
      	puts  "---------------------------"
			@board[1].each_with_index do |cellstuff,cell|
				print '|'
				print cell
				print '|'
			end
			puts

		@board.each_with_index do |rowstuff,row|
			@board[row].each_with_index do |cellstuff,cell|
				print '|'
				if @board[row][cell].cellmarker=='bomb'&& @board[row][cell].hidden==false
					print '*'
				else
					print '-'
				end
				print '|'
			end
			puts
		end
		puts "---------------------------"
	end
end

b=Board.new(9,9,10)
b.render