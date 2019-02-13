require_relative 'tile'
require_relative 'thing'


class Room
    attr_accessor :grid

    def initialize(size)

        @grid = Array.new(size){Array.new(size){Tile.new}}
        self.build_walls
    end

    def build_walls
        grid.each_with_index do |row, idx|
            if idx == 0 || idx == row.size - 1
                row.each do |tile|
                    tile << TopWall.new
                end
            else
                row.each_with_index do |tile, i|
                    if i == 0 || i == row.size - 1
                        tile << SideWall.new
                    end
                end
            end
        end
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



end

