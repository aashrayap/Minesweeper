class Player
    def initialize(name)
        @name = name
    end 
    attr_accessor :name
    def coordinates
        coord=get_coord
    end
    def get_coord
        puts "Please pick a coordinate in the format (xy)"
        final_coord = []
        tempcoord = gets.chomp 
        coordinates = tempcoord.split('')
        final_coord<<coordinates[0].to_i
        final_coord<<coordinates[1].to_i
        print final_coord
        return final_coord
    end
end

p=Player.new('calvin')
p.coordinates