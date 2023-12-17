# frozen_string_literal: true

require "spec_helper"
require './server/app'

describe AdParametersServer::App do
  let(:app) { AdParametersServer::App.new }

  context "GET to /placements" do
    let(:response) { get "/placements?placement_id=plc-8&floor=10" }

    it "returns status 200 OK" do
      expect(response.status).to eq 200
    end

    it "returns protobuf content_type" do
      expect(response.content_type).to eq('application/x-protobuf')
    end
  end
end
