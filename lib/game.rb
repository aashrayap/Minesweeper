require './player'
require './board'
require 'colorize'

class Game

	def initialize
		@game
		puts "What is your name?"
		name=gets.chomp
		@player=Player.new(name)
	end
	attr_reader :difficulty , :player , :board

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
			@game=Board.new(9,9,10,@player)
	    elsif difficulty=='2'
	    	@game=Board.new(16,16,40,@player)
		elsif difficulty=='3'
			@game=Board.new(16,30,99,@player) 
		end
	end
	def play
		intro
		select_difficulty
		@game.render
		@player.coordinates
		@game.bombs_adjacent
	end
end

g=Game.new
g.play
# g.select_difficulty
