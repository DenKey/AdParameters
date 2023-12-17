# frozen_string_literal: true

require './config/loader'

class AdParameters
  Proto = FYBER::Userconfiguration

  def initialize
    data = XmlParser.new('fyber.xml').call
    @placements = data[:placements]
    @creatives = data[:creatives]
    @placement_seq = Proto::PlacementSeq.new
  end

  def call
    @placements.each do |placement|
      @placement_seq.placement << build_proto_placement(placement)
    end

    self
  end

  def encode_proto
    Proto::PlacementSeq.encode(@placement_seq)
  end

  def encode_json
    Proto::PlacementSeq.encode_json(@placement_seq)
  end

  def to_hash
    JSON.parse(encode_json)
  end

  private

  def build_proto_placement(placement)
    placement_proto = Proto::Placement.new(id: placement.id)
    @creatives.each do |creative|
      if creative.placement_eligible?(placement)
        placement_proto.creative << Proto::Creative.new(id: creative.id, price: creative.price_eur)
      end
    end
    placement_proto
  end
end
