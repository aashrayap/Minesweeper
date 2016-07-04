require './player'
require 'pry'
require './cell'
class Board

	def initialize(rows,columns,mines,player)
		cell=0
		@player=player
		@grid = Array.new(rows){Array.new(columns)}
		@grid.each_with_index do |rowstuff,row|
			@grid[row].each_with_index do |colstuff,column|
				@grid[row][column]=Cell.new(row,column,'blank')
			end
		end

		mines.times do
           randomizer = @grid.sample.sample
           if randomizer.cellmarker=='bomb'
                redo
           else randomizer.cellmarker='bomb'
          end
        end
	end
	
	def render
		puts "------- Minesweeper -------"
      	puts  "---------------------------"
			@grid[1].each_with_index do |cellstuff,cell|
				print '|'
				print cell
				print '|'
			end
			puts

		@grid.each_with_index do |rowstuff,row|
			@grid[row].each_with_index do |cellstuff,cell|
				print '|'
				if @grid[row][cell].cellmarker=='bomb'&& @grid[row][cell].hidden
					print '*'
				elsif @grid[row][cell].cellmarker=='bomb'&& @grid[row][cell].hidden
					print '-'
				elsif  @grid[row][cell].cellmarker=='blank'&& @grid[row][cell].hidden
					print '-'
				elsif @grid[row][cell].cellmarker=='numbombs'&& !@grid[row][cell].hidden
					 display_neighbor_bombs(@player.coord)
				elsif @grid[row][cell].cellmarker=='blank'&& !@grid[row][cell].hidden
					print ' '
				else
					print 'e'
				end
				print '|'
			end
			puts
		end
		puts "---------------------------"
	end

	def set_value(coord)
		@grid[coord[0]][coord[1]].hidden=false
		if count_neighbor_bombs(coord)!=0
		@grid[coord[0]][coord[1]].cellmarker='numbombs'
		end
	end

	def display_neighbor_bombs(coord)
		num_neighbor_bombs=count_neighbor_bombs(coord)
		print num_neighbor_bombs
	end

	def count_neighbor_bombs(count_coord)
		row=count_coord[0]
		column=count_coord[1]
		neighbors=[]
		neighbors <<@grid[row-1][column-1]
		neighbors <<@grid[row-1][column]
		neighbors <<@grid[row-1][column+1]
		neighbors <<@grid[row][column-1]
		neighbors <<@grid[row][column+1]
		neighbors <<@grid[row+1][column-1]
		neighbors <<@grid[row+1][column]
		neighbors <<@grid[row+1][column+1]
		counter=0
		neighbors.each do |x|
			if x.cellmarker=='bomb'
				counter+=1
			else
				next
			end
		end
		counter
	end

	def is_bomb?(coord)
		if @grid[coord[0]][coord[1]].cellmarker=='bomb'
			return true
		end
	end
end







