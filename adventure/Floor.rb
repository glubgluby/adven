require_relative 'thing'
require_relative 'tile'
require_relative 'room'


class Floor
    attr_reader :grid, :size
    def initialize(size)
        @size = size
        @grid = Floor.floor_gen(self)
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
    def [](pos)
        y, x = pos
        grid[y][x]
    end
    
    #need to define where we have a border on the floor
    def self.floor_gen(floor)
        new_fl = Array.new(7){Array.new(7)}
        new_fl.map!.with_index do |row, y|
            row.map!.with_index do |room, x|
                
                Room.new([y,x], floor)
                
            end
        end
        new_fl
    end

end
