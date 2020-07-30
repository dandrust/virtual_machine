# frozen_string_literal: true

require_relative 'instruction/load_word'
require_relative 'instruction/store_word'
require_relative 'instruction/add'
require_relative 'instruction/subtract'

class ControlUnit
    def decode(instruction, param_one, param_two)
        return false  if instruction == 0xFF
        
        case instruction
        when 0x01
            Instruction::LoadWord.new(param_one, param_two)
        when 0x02
            Instruction::StoreWord.new(param_one, param_two)
        when 0x03
            Instruction::Add.new(param_one, param_two)
        when 0x04
            Instruction::Subtract.new(param_one, param_two)
        else
            throw UnknownInstructionError.new(printf("0x%x is not a valid instruction\n", instruction || 0x00))
        end 
    end
end