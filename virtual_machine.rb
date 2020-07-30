# frozen_string_literal: true

require_relative 'memory'
require_relative 'cpu'

class VirtualMachine
    attr_reader :memory
    attr_reader :cpu

    def load *memory
        @memory = Memory.new memory
    end

    def run
        @cpu = Cpu.new(memory)
        cpu.run
    end

    def output
        return memory.output
    end
end

