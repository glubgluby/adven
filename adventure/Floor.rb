require_relative 'thing'
require_relative 'tile'
require_relative 'room'


class Floor
    attr_reader :grid, :size
    def initialize(size)
        @size = size
        @grid = Floor.floor_gen
    end
    # set up booleans for room creation to set where doors can be
    def display
        system('clear')
        i = 0
        while i < size
            j = 0
            while j < size
                grid[i].each do |room|
                    room.row_render(j)
                end
                puts
                j += 1
            end
            puts
            i += 1
        end

    end

    #need to define where we have a border on the floor
    def self.floor_gen
        new_fl = Array.new(7){Array.new(7)}
        new_fl.map!.with_index do |row, y|
            row.map!.with_index do |room, x|
                if x == 0 && y == 0
                    Room.new(7, :nw_corner)
                elsif x == 0 && y == 6
                    Room.new(7, :sw_corner)
                elsif x == 6 && y == 6
                    Room.new(7, :se_corner)
                elsif x == 6 && y == 0
                    Room.new(7, :ne_corner)
                elsif y == 0
                    Room.new(7, :north)
                elsif y == 6
                    Room.new(7, :south)
                elsif x == 0
                    Room.new(7, :west)
                elsif x == 6
                    Room.new(7, :east)
                else
                    Room.new(7)
                end
            end
        end
        new_fl
    end

end
