require_relative 'thing'


class Tile
    attr_accessor :containing

    def initialize
        @containing = []
    end

    def empty?
        self.containing.empty?
    end

    def display
        if !empty?
            self.containing.first.display
        else
            ' '
        end
    end

    def <<(arg)
        self.containing << arg
    end

    def shift
        self.containing.shift unless empty?
    end
    def pop
        self.containing.pop unless empty?
    end
    def include?(class_)
        self.containing.any?{|el| el.class == class_}
    end

    def =(item) #should only be used in room generation
        self.containing = [item]
    end

end
