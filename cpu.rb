# frozen_string_literal: true

require_relative 'program_counter'
require_relative 'control_unit'
require_relative 'register'

class Cpu
    attr_reader :registers
    attr_reader :control_unit
    attr_reader :memory

    def initialize memory
        @memory = memory
        @program_counter = ProgramCounter.new
        @control_unit = ControlUnit.new
        @registers = [
            ProgramCounter.new,
            Register.new,
            Register.new
        ]
    end

    def run
        while instruction = control_unit.decode(*fetch)
            execute(instruction)
            program_counter.increment
        end
    end

    def fetch
        memory.fetch_instruction(program_counter.address)
    end

    def execute(instruction)
        instruction.execute(self)
    end

    def params
        [
            memory[program_counter.look_ahead(1)], 
            memory[program_counter.look_ahead(2)]
        ]
    end

    def program_counter
        registers[0x00]
    end
end

class UnknownInstructionError < ArgumentError
end



