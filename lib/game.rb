require './player'
require './board'
require 'colorize'

class Game

	def initialize
		@board
		puts "What is your name?"
		name=gets.chomp
		@player=Player.new(name)
	end
	attr_reader :difficulty , :player , :grid

	def intro
		puts "Welcome to Minesweeper #{player.name} !, have fun and dont step on any mines!".blue
	end

	def select_difficulty
		puts "Please select your difficulty, 1:easy 2:medium 3:hard"
		difficulty=gets.chomp
		game_mode(difficulty)
	end

	def game_mode(difficulty)
		if difficulty=='1'
			@board=Board.new(9,9,10,@player)
	    elsif difficulty=='2'
	    	@board=Board.new(16,16,40,@player)
		elsif difficulty=='3'
			@board=Board.new(16,30,99,@player) 
		end
	end
	def play
		intro
		select_difficulty
		while true
		@board.render
		@player.coordinates
		break if game_over?
		@board.set_value(@player.coord)
		
		end
	
	
	end

	def game_over?
		if @board.is_bomb?(@player.coord)
			puts "Game over"
			return true
		else
			return false
		end
	end
end

g=Game.new
g.play
# g.select_difficulty
