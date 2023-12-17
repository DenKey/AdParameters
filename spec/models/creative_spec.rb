# frozen_string_literal: true

require "spec_helper"

RSpec.describe Creative do
  subject { described_class.new(id: id, price: price, currency: currency) }

  let(:id) { 'Video-1' }
  let(:price) { 331 }
  let(:currency) { 'TYR' }

  it { expect(subject.id).to eq(id) }
  it { expect(subject.price).to eq(price) }
  it { expect(subject.currency).to eq(currency) }

  it { expect(subject.price_eur).to eq(100) }
end
