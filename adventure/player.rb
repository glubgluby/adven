require_relative 'thing'
require_relative 'tile'
require_relative 'room'

class Player
    attr_reader :display, :name, :m_health, :solid
    attr_accessor :c_health, :gold

    def initialize(name)
        @name = name
        @display = :X
        @c_health = 20
        @m_health = 20
        @gold = 0
        @solid = true
    end

    def get_input
        gets.chomp.downcase
    end
    
    def dead?
        c_health <= 0
    end

    def acquire(gold)
        self.gold += gold
    end

end