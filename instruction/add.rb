# frozen_string_literal: true

require_relative '../instruction'

class Instruction::Add < Instruction
    alias_method :register_one, :param_one
    alias_method :register_two, :param_two

    def execute(context)
        addend_one = context.registers[register_one].value
        addend_two = context.registers[register_two].value

        context.registers[register_one].value = addend_one + addend_two
    end
end