# frozen_string_literal: true

class Instruction
    attr_reader :param_one
    attr_reader :param_two

    def initialize(param_one, param_two)
        @param_one = param_one
        @param_two = param_two
    end

    def execute(context)
        throw NotImplementedError.new("Subclass instructions must implement #execute")
    end
end