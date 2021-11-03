# frozen_string_literal: false

require './lib/problem_two'
require 'spec_helper'

describe '#solution' do
  context 'when given "Codility We test coders"  and K = 14' do
    it 'returns "Codility We"' do
      given_message = 'Codility We test coders'
      given_k = 14
      expected_value = 'Codility We'
      returned_value = solution(given_message, given_k)
      expect(returned_value).to eq(expected_value)
    end
  end
  context 'when given message = "Why not" and K = 100' do
    it 'returns "Why not"' do
      given_message = 'Why not'
      given_k = 100
      expected_value = 'Why not'
      returned_value = solution(given_message, given_k)
      expect(returned_value).to eq(expected_value)
    end
  end
  context 'when given message = "The quick brown fox jumps over the lazy dog" and K = 39' do
    it 'returns "The quick brown fox jumps over the lazy"' do
      given_message = 'The quick brown fox jumps over the lazy dog'
      given_k = 39
      expected_value = 'The quick brown fox jumps over the lazy'
      returned_value = solution(given_message, given_k)
      expect(returned_value).to eq(expected_value)
    end
  end
  context 'when given message = "To crop or not to crop" and K = 21' do
    it 'returns "To crop or not to"' do
      given_message = 'To crop or not to crop'
      given_k = 21
      expected_value = 'To crop or not to'
      returned_value = solution(given_message, given_k)
      expect(returned_value).to eq(expected_value)
    end
  end
  context 'when given more generic examples' do
    it 'returns "hi" when given m = "hi" k_val = 2' do
      given_message = 'hi'
      given_k = 2
      expected_value = 'hi'
      returned_value = solution(given_message, given_k)
      expect(returned_value).to eq(expected_value)
    end
    it 'returns "" when given m = "hii" k_val = 2' do
      given_message = 'hii'
      given_k = 2
      expected_value = ''
      returned_value = solution(given_message, given_k)
      expect(returned_value).to eq(expected_value)
    end
  end
end
