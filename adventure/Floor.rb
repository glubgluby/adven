require_relative 'thing'
require_relative 'tile'
require_relative 'room'


class Floor
    attr_reader :grid, :size
    def initialize(size)
        @size = size
        @grid = Array.new(size){Array.new(size){Room.new(size)}}
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


end
