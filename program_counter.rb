# frozen_string_literal: true

class ProgramCounter
    attr_reader :address
    INSTRUCTION_WIDTH = 0x03

    def initialize
        @address = 0x00
    end

    def increment
        @address += INSTRUCTION_WIDTH
    end

    def look_ahead(delta)
        @address + delta
    end
end