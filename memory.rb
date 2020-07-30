# frozen_string_literal: true

class Memory < Array
    LENGTH = 0x14

    def [] index
        if index < 0x00 || index >= LENGTH
            throw MemoryOverflowException.new(printf("Address 0x%x is outside main memory and cannot be accessed\n", index))
        end
        super(index)
    end

    def fetch_instruction(index)
        instruction = self[index]
        param_one = self[index + 1]
        param_two = self[index + 2]

        [instruction, param_one, param_two]
    end

    def fetch_word(index)
        little_end = self[index]
        big_end = self[index + 1]

        (big_end * 0x100) + little_end
    end

    def store_word(index, value)
        big_end = value / 0x100
        little_end = value % 0x100

        self[index] = little_end
        self[index + 1] = big_end
    end

    def output
        fetch_word(0x0e)
    end
end

class MemoryOverflowException < IndexError
end