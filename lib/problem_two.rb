# frozen_string_literal: true

def solution(message, k_value)
  return message if message.length <= k_value

  max_len_message = message[0, k_value + 1]
  last_space_index = max_len_message.rindex(' ')
  max_len_message[0, last_space_index || 0]
end
