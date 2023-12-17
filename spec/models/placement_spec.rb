# frozen_string_literal: true

require "spec_helper"

RSpec.describe Placement do
  subject { described_class.new(id: id, floor: floor, currency: currency) }

  let(:id) { 'Plc-1' }
  let(:floor) { 111.9 }
  let(:currency) { 'SEK' }

  it { expect(subject.id).to eq(id) }
  it { expect(subject.floor).to eq(floor) }
  it { expect(subject.currency).to eq(currency) }

  it { expect(subject.floor_eur).to eq(10) }
end
