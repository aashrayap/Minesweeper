require 'player'
require 'board'
require 'colorize'

class Game

	def initialize
		@game
		@player=Player.new
	end
	attr_reader :difficulty , :player , :board

	def intro
		puts "Welcome to Minesweeper, have fun and dont step on any mines!".blue
	end

	def select_difficulty
		puts "Please select your difficulty, 1:easy 2:medium 3:hard"
		difficulty=gets.chomp
		@game=game_mode
	end

	def game_mode
		if difficulty=='1'
			Board.new(9,9,10)
	    elsif difficulty=='2'
	    	Board.new(16,16,40)
		elsif difficulty=='3'
			Board.new(16,30,99) 
		end
	end
end

g=Game.new
g.intro
# g.select_difficulty
