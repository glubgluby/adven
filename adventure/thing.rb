require_relative 'tile'


class Thing
    attr_reader :solid, :name
    attr_accessor :display

    def initialize(name, display, solid)
        @name = name
        @display = display
        @solid = solid
    end


    

end

class TopWall < Thing
    def initialize
        super('Wall',:_, true)
    end
end
class SideWall < Thing
    def initialize
        super('Wall',:|,true)
    end
end
class TopDoor < Thing
    attr_accessor :solid
    def initialize
        super('door',:H, true)
    end
end
class SideDoor < Thing
    attr_accessor :solid
    def initialize
        super('door',:'=', true)
    end
    
end