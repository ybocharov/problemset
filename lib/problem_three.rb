# frozen_string_literal: true

class WordMachine
  LARGEST_INT = 1_048_575
  SMALLEST_INT = 0
  attr_reader :stack

  def read_operation_string(string_input)
    operation_list = string_input.split(' ')
    operation_list.each do |operation|
      op_result = do_operation(operation)
      return -1 if op_result == -1
    end
    pop
  end

  def initialize
    @stack = []
  end

  def do_operation(string)
    case string
    when /^DUP$/
      dup
    when /^-$/
      subtract
    when /^\+$/
      add
    when /^POP$/
      pop
    when /^\d*$/
      push(string)
    else
      -1
    end
  end

  def push(int)
    (int = parse_int(int)) == -1 ? -1 : stack.push(int)
  end

  def dup
    push(stack.last)
  end

  def pop
    popped_num = stack.pop
    return -1 if popped_num.nil? || popped_num.negative?

    popped_num
  end

  def subtract
    return -1 if (val_one = pop) == -1
    return -1 if (val_two = pop) == -1

    push(val_one - val_two)
  end

  def add
    return -1 if (val_one = pop) == -1
    return -1 if (val_two = pop) == -1

    push(val_one + val_two)
  end

  def parse_int(string)
    return -1 if string.nil?

    num = string.to_i
    (0..LARGEST_INT).include?(num) ? num : -1
  end
end

def solution(string)
  machine = WordMachine.new
  machine.solution(string)
end
