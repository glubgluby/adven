require_relative 'tile'
require_relative 'thing'


class Room
    attr_accessor :grid
    attr_reader :pos
    DOOR_CHANCE = [0,1,2,3]

    def initialize(pos, floor)
        @floor = floor
        @grid = Array.new(7){Array.new(7){Tile.new}}
        @pos = pos
        self.build_walls
    end


    def build_walls
        grid.each_with_index do |row, y|
            if y == 0 || y == 6
                row.each do |tile|
                    tile << TopWall.new
                end
            else
                row.each_with_index do |tile, x|
                    if x == 0 || x == row.size - 1
                        tile << SideWall.new
                    end
                end
            end
        end
    end

    def build_doors
        # if 
        y, x = pos
        #build doors
        #doors cant go off maps
        #if a room has a door connecting to another room, that room should have one 
        #connecting back
        # [0, 1, 2, 3, 4, 5, 6]
        # [0, 1, 2, 3, 4, 5, 6]
        # [0, 1, 2, 3, 4, 5, 6]
        # [0, 1, 2, 3, 4, 5, 6]
        # [0, 1, 2, 3, 4, 5, 6]
        # [0, 1, 2, 3, 4, 5, 6]
        # [0, 1, 2, 3, 4, 5, 6]
        
    end

    def display
        self.grid.each do |row|
            row.each do |tile|
                print tile.display
                print " "
            end
            puts
        end
        nil
    end
    def row_render(i)
        grid[i].each do |tile|
            print tile.display
            print " "
        end
        nil
    end

    def include?(class_)
        room.grid.each do |row|
            row.each do |tile|
                return true if tile.include?(class_)
            end
        end
        false
    end



end

