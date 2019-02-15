require_relative 'tile'
require_relative 'thing'
require 'byebug'


class Room
    attr_accessor :grid
    attr_reader :pos, :floor
    DOOR_CHANCE = [1,2,2,2,3,3,3,3,4,4,4,3]

    def initialize(pos, floor)
        @floor = floor
        @grid = Array.new(7){Array.new(7){Tile.new}}
        @pos = pos
        self.build_walls
        self.build_doors
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
        possible_top_doors = [[0,3],[6,3]]
        possible_side_doors = [[3,6],[3,0]]
        if y == 0
            possible_top_doors.delete([0,3])
        end
        if x == 0
            possible_side_doors.delete([3,0])
        end
        if y == 6
            possible_top_doors.delete([6,3])
        end
        if x == 6
            possible_side_doors.delete([3,6])
        end
        possible_top_doors.each{|position| self[position].containing = [TopDoor.new]}
        possible_side_doors.each{|position| self[position].containing = [SideDoor.new]}
        #build doors
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

    def[](pos)
        y, x = pos
        grid[y][x]
    end
    #this will overwrite tiles. DO NOT USE
    # def[]=(pos, value)
    #     y, x = pos
    #     self[y][x] = value
    # end


end

