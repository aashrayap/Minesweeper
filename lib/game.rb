require 'player'
require 'board'
require 'colorize'

class Game

	def initialize
		@board
		@player=Player.new
	end
	attr_reader :player, :board

	def intro
		puts "Welcome to Minesweeper, have fun and dont step on any mines!".blue
	end

	def select_difficulty
		puts "Please select your difficulty, 1:easy 2:medium 3:hard"
		difficulty=gets.chomp
		difficulty.to_s
		game_mode
	end

	def game_mode()
		if difficulty==1
			@board=Board.new(9,9,10)
		end
	end
end

g=Game.new
g.intro
