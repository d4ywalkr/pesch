require 'bestellung'

RSpec.describe Bestellung do
  describe 'TYPES' do
    it 'holds the available types of Bestellung' do
      expect(described_class::TYPES).to eq [:handy, :buch]
    end
  end
end
