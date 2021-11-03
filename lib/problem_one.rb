# frozen_string_literal: true

def solution(integer_input)
  sorted_int = integer_input.to_s.chars.sort.reverse.join.to_i
  sorted_int > 100_000_000 ? -1 : sorted_int
end
