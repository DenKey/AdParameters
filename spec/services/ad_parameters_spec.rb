# frozen_string_literal: true

require "spec_helper"

RSpec.describe AdParameters do
  subject { described_class.new('spec/fixtures/test.xml').call }

  describe '#call' do
    it 'returns self' do
      expect(subject).to be_kind_of(AdParameters)
    end
  end

  let(:result_hash) {
    {
      "placement" => [
        {
          "id" => "plc-1", "creative" => [
            {
             "id" => "Picture-1",
             "price" => 7.34
            }
          ]
        }
      ]
    }
  }

  describe '#to_hash' do
    it 'returns Hash' do
      expect(subject.to_hash).to be_kind_of(Hash)
    end

    it 'returns hash contains valid data' do
      expect(subject.to_hash).to eq(result_hash)
    end
  end
end
