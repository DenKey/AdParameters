# frozen_string_literal: true

# Keeping currency in constants it's a bad idea.
# In my experience usually it's a two common way to keep it
# Dynamically (get it from third party service)
# or Fixed (keeping it by agreement with customers and grab from DB)
class CurrencyExchange
  RATES = {
    'EUR' => 1,
    'USD' => 1.13,
    'TYR' => 3.31,
    'SEK' => 11.19,
  }

  class << self
    def to_eur(from, amount)
      raise 'Please use correct currency' unless RATES.keys.include?(from)

      (amount.to_f / RATES[from]).round(2)
    end
  end
end
