# frozen_string_literal: true

require 'rspec'
require_relative '../app/calc.rb'

RSpec.describe Calc do
  describe '#calc' do
    context 'to test sumater' do
      it 'should sum two numbers' do
        # puts 'pass'
        expect(subject.sum(2, 4)).to eq 6
      end
    end
  end
end
