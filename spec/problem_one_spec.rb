# frozen_string_literal: false

require './lib/problem_one'
require 'spec_helper'

describe '#solution' do
  context 'when given edge cases' do
    it 'returns -1 if given 2,147,483,647' do
      given_value = 2_147_483_647
      expected_value = -1
      expect(solution(given_value)).to eq(expected_value)
    end

    it 'returns 0 if given 0' do
      given_value = 0
      expected_value = 0
      expect(solution(given_value)).to eq(expected_value)
    end
  end
  context 'when given examples' do
    it 'returns -1 if if largest number in family would be over 100,000,000' do
      given_value = 100_000_001
      expected_value = -1
      expect(solution(given_value)).to eq(expected_value)
    end
    it 'returns 321 if given 213' do
      given_value = 213
      expected_value = 321
      expect(solution(given_value)).to eq(expected_value)
    end
    it 'returns 553 if given 553' do
      given_value = 553
      expected_value = 553
      expect(solution(given_value)).to eq(expected_value)
    end
    it 'returns 100,000,000 if given 100,000,000' do
      given_value = 100_000_000
      expected_value = 100_000_000
      expect(solution(given_value)).to eq(expected_value)
    end
  end
end
