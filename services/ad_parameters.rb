# frozen_string_literal: true

require './config/loader'

class AdParameters
  Proto = FYBER::Userconfiguration

  def initialize(file_path = 'data/fyber.xml', scope: nil, reject_if_no_creatives: false)
    @scope = scope
    @reject_if_no_creatives = reject_if_no_creatives
    data = XmlParser.new(file_path).call
    @placements = data[:placements]
    @creatives = data[:creatives]
    @placement_seq = Proto::PlacementSeq.new
  end

  def call
    @placements.each do |placement|
      if build_proto_placement(placement)
        @placement_seq.placement << build_proto_placement(placement)
      else
        next
      end
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
    proto_creatives = []
    @creatives.each do |creative|
      if eligible?(creative, placement)
        proto_creatives << Proto::Creative.new(id: creative.id, price: creative.price_eur)
      end
    end

    return nil if @reject_if_no_creatives && proto_creatives.empty?

    Proto::Placement.new(id: placement.id, creative: proto_creatives)
  end

  def eligible?(creative, placement)
    if @scope
      placement.id == @scope[:placement_id] && creative.price_eur >= @scope[:floor]
    else
      creative.placement_eligible?(placement)
    end
  end
end
