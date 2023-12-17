# frozen_string_literal: true

require './config/loader'
require 'sinatra'

module AdParametersServer
  class App < Sinatra::Base
    get '/' do
      erb :index
    end

    get '/placements' do
      scope = { placement_id: params[:placement_id], floor: params[:floor].to_f }
      content_type 'application/x-protobuf'
      AdParameters.new(reject_if_no_creatives: true, scope: scope).call.encode_proto
    end

    error 400..510 do
      erb :index
    end
  end
end
