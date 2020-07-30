# frozen_string_literal: true

require_relative '../instruction'

class Instruction::LoadWord < Instruction
    alias_method :register, :param_one
    alias_method :address, :param_two

    def execute(context)
        data = context.memory.fetch_word address
        my_register = context.registers[register]
        
        my_register.value = data
    end
end