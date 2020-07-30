# frozen_string_literal: true
require_relative '../virtual_machine'

RSpec.describe VirtualMachine do
  
    it "adds two numbers" do
        input_one = 1
        input_two = 2
        program = add_program(
            decimal_to_little_endian_hex_array(input_one),
            decimal_to_little_endian_hex_array(input_two)
        )

        expected = input_one + input_two
        actual = exercise(program)

        expect(actual).to eq(expected)
    end

    it "adds two large numbers" do
        input_one = 300
        input_two = 350
        program = add_program(
            decimal_to_little_endian_hex_array(input_one),
            decimal_to_little_endian_hex_array(input_two)
        )

        expected = input_one + input_two
        actual = exercise(program)

        expect(actual).to eq(expected)
    end

    it "subtracts one number from another" do
        input_one = 5
        input_two = 4
        program = subtract_program(
            decimal_to_little_endian_hex_array(input_one),
            decimal_to_little_endian_hex_array(input_two)
        )

        expected = input_one - input_two
        actual = exercise(program)

        expect(actual).to eq(expected)
    end

    it "subtracts one large number from another" do
        input_one = 850
        input_two = 123
        program = subtract_program(
            decimal_to_little_endian_hex_array(input_one),
            decimal_to_little_endian_hex_array(input_two)
        )

        expected = input_one - input_two
        actual = exercise(program)

        expect(actual).to eq(expected)
    end
end

def exercise(program)
    vm = VirtualMachine.new
    vm.load(*program)
    vm.run
    vm.output
end

def decimal_to_little_endian_hex_array(value)
    [
        value % 0x100,
        value / 0x100
    ]
end

def add_program(input_one, input_two)
    [
        0x01, 0x01, 0x10,   # load INPUT1 to register 1
        0x01, 0x02, 0x12,   # load INPUT2 to register 2
        0x03, 0x01, 0x02,   # add register 1, register 2
        0x02, 0x01, 0x0e,   # store register1 to OUTPUT
        0xff,               # exit
        0x00,               # emtpy instruction
        0x00, 0x00,         # OUTPUT
        *input_one,         # INPUT1
        *input_two          # INPUT2
    ]
end

def subtract_program(input_one, input_two)
    [
        0x01, 0x01, 0x10,   # load INPUT1 to register 1
        0x01, 0x02, 0x12,   # load INPUT2 to register 2
        0x04, 0x01, 0x02,   # subtract register 1, register 2
        0x02, 0x01, 0x0e,   # store register1 to OUTPUT
        0xff,               # exit
        0x00,               # emtpy instruction
        0x00, 0x00,         # OUTPUT
        *input_one,         # INPUT1
        *input_two          # INPUT2
    ]
end