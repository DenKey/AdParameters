# frozen_string_literal: true

require "spec_helper"

RSpec.describe CurrencyExchange do
  subject { described_class }

  describe '#to_eur' do
    it 'returns valid EUR amount for USD' do
      expect(subject.to_eur('USD', 10.17)).to eq(9)
    end

    it 'returns valid EUR amount for TYR' do
      expect(subject.to_eur('TYR', 1324)).to eq(400)
    end

    it 'returns valid EUR amount for SEK' do
      expect(subject.to_eur('SEK', 2797.5)).to eq(250)
    end

    it 'raises an error if currency not supported or wrong' do
      expect { subject.to_eur('Foo', 10) }.to raise_error(Exception, 'Please use correct currency')
    end
  end
end
