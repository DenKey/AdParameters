# frozen_string_literal: true

require './config/loader'

class Creative
  attr_accessor :id, :price, :currency

  def initialize(id:, price:, currency:)
    @id = id
    @price = price
    @currency = currency
  end

  def price_eur
    CurrencyExchange.to_eur(currency, price)
  end

  def placement_eligible?(placement)
    price_eur >= placement.floor_eur
  end
end
