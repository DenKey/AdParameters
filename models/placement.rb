# frozen_string_literal: true

require './config/loader'

class Placement
  attr_accessor :id, :floor, :currency

  def initialize(id:, floor:, currency:)
    @id = id
    @floor = floor
    @currency = currency
  end

  def floor_eur
    CurrencyExchange.to_eur(currency, floor)
  end
end
