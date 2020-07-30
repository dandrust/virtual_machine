# frozen_string_literal: true

require_relative '../instruction'

class Instruction::Subtract < Instruction
    alias_method :register_one, :param_one
    alias_method :register_two, :param_two

    def execute(context)
        minuend = context.registers[register_one].value
        subtrahend = context.registers[register_two].value

        context.registers[register_one].value = minuend - subtrahend
    end
end