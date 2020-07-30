# frozen_string_literal: true

require_relative '../instruction'

class Instruction::StoreWord < Instruction
    alias_method :register, :param_one
    alias_method :address, :param_two

    def execute(context)
        data = context.registers[register].value
        
        context.memory.store_word(address, data)
    end
end