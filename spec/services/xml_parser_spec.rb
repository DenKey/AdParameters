# frozen_string_literal: true

require "spec_helper"

RSpec.describe XmlParser do
  subject { described_class.new('spec/fixtures/test.xml') }

  describe '#call' do
    it 'returns Hash' do
      expect(subject.call).to be_kind_of(Hash)
    end

    it 'returns hash contains valid data' do
      result = subject.call
      expect(result[:creatives]).to match_array([
                                                  have_attributes(class: Creative, id: 'Picture-1', price: '7.3423', currency: 'EUR'),
                                                ])

      expect(result[:placements]).to match_array([
                                                  have_attributes(class: Placement, id: 'plc-1', floor: '5', currency: 'EUR'),
                                                ])
    end

    it 'raises an error if file path is broken' do
      expect { described_class.new('spec/fixtures/fail.xml') }.to raise_error(Exception, 'File path is wrong')
    end
  end
end
