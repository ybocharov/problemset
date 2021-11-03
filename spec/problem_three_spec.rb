# frozen_string_literal: false

require './lib/problem_three'
require 'spec_helper'

describe WordMachine do
  subject(:test_machine) { described_class.new }
  describe '#solution' do
    context 'unit loop tests' do
      it 'calls do_opertation for each operator in string' do
        given_string = '4 5 + DUP +'
        expect(test_machine).to receive(:do_operation).exactly(5).times
        expect(test_machine).to receive(:pop)
        test_machine.read_operation_string(given_string)
      end

      it 'returns early if do_operation returns -1' do
        allow(test_machine).to receive(:do_operation).and_return(4, 5, -1)
        given_string = '4 5 + DUP +'
        expect(test_machine).to receive(:do_operation).exactly(3).times
        expect(test_machine).to_not receive(:pop)
        test_machine.read_operation_string(given_string)
      end
    end

    context 'integration tests' do
      context 'when given "4 5 6 - 7 +"' do
        it 'returns 8' do
          given_value = '4 5 6 - 7 +'
          expected_value = 8
          returned_value = test_machine.read_operation_string(given_value)
          expect(returned_value).to eq(expected_value)
        end
      end
      context 'when given "13 DUP 4 POP 5 DUP + DUP + -"' do
        it 'returns 7' do
          given_value = '13 DUP 4 POP 5 DUP + DUP + -'
          expected_value = 7
          returned_value = test_machine.read_operation_string(given_value)
          expect(returned_value).to eq(expected_value)
        end
      end
      context 'when given "5 6 + -"' do
        it 'returns -1' do
          given_value = '5 6 + -'
          expected_value = -1
          returned_value = test_machine.read_operation_string(given_value)
          expect(returned_value).to eq(expected_value)
        end
      end
      context 'when given "3 DUP 5 - -"' do
        it 'returns -1' do
          given_value = '3 DUP 5 - -'
          expected_value = -1
          returned_value = test_machine.read_operation_string(given_value)
          expect(returned_value).to eq(expected_value)
        end
      end
    end
  end

  describe '#push' do
    it 'returns -1 if parse_int returns -1' do
      allow(test_machine).to receive(:parse_int).and_return(-1)
      returned_val = test_machine.push(5)
      expect(returned_val).to eq(-1)
    end

    it 'calls parse int' do
      expect(test_machine).to receive(:parse_int)
      test_machine.push(5)
    end
    let(:stack) { test_machine.stack }
    it 'changes the stack if valid int given' do
      expect { test_machine.push(4) }.to change { stack }.to([4])
    end
  end

  describe '#add' do
    it 'calls push if both pops are positve ints' do
      allow(test_machine).to receive(:pop).and_return(5)
      expect(test_machine).to receive(:pop).exactly(2).times
      expect(test_machine).to receive(:push)
      test_machine.add
    end
  end

  describe '#dup' do
    it 'returns -1 if stack empty' do
      expect(test_machine.dup).to eq(-1)
    end
  end

  describe '#do_operation' do
    it 'calls dup with "DUP"' do
      expect(test_machine).to receive(:dup)
      test_machine.do_operation('DUP')
    end
    it 'calls pop with "POP"' do
      expect(test_machine).to receive(:pop)
      test_machine.do_operation('POP')
    end
    it 'calls add with "+"' do
      expect(test_machine).to receive(:add)
      test_machine.do_operation('+')
    end
    it 'calls subtract with "-"' do
      expect(test_machine).to receive(:subtract)
      test_machine.do_operation('-')
    end
    it 'calls push with an int' do
      expect(test_machine).to receive(:push)
      test_machine.do_operation('54')
    end
    it 'returns -1 for anything else' do
      expect(test_machine.do_operation('^&')).to eq(-1)
    end
  end

  describe '#parse_int' do
    it 'returns -1 if given a neagtive' do
      expect(test_machine.parse_int('-5')).to eq(-1)
    end
    it 'returns -1 if given a huge num' do
      expect(test_machine.parse_int('-5000000000000')).to eq(-1)
    end
    it 'returns -1 if given nil' do
      expect(test_machine.parse_int(nil)).to eq(-1)
    end
    it 'returns a correct int if given a valid num' do
      expect(test_machine.parse_int('67')).to eq(67)
    end
  end
end
