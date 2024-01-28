
require_relative '../app/calc.rb'

RSpec.describe Calc do
  describe '#calc' do
    it 'can sum two numbers' do
      expect(subject.sum(2, 4)).to eq 6
    end
  end
end
