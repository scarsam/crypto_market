# Crypto Coin belongs to Crypto Currencies
# Responsible for handling all of the Crypto Coin information

class CryptoMarket::Coin
  include CryptoMarket
  attr_accessor :name, :price_usd, :price_btc, :market_cap_usd, :percent_change_1h,
                :percent_change_24h, :percent_change_7d, :last_updated_unix

  # Instantiate Coin with the attributes below, adds + sign for positive change numbers
  def initialize(name, price_usd, price_btc, market_cap_usd, percent_change_24h, last_updated_unix)
    @name = name
    @price_usd = price_usd.to_f.round(2)
    @price_btc = price_btc.to_i
    @market_cap_usd = market_cap_usd.to_i
    @percent_change_24h = percent_change_24h.to_i
    @last_updated_unix = last_updated_unix
  end

  # Prints out the coin attributes for the Coin object with terminal-table gem
  def attributes
    table = terminal_table do |t|
      t.title = name.upcase
      t.add_row ["Price USD:", "$#{price_usd}"]
      t.add_row ["Price BTC:", "#{price_btc}"]
      t.add_row ["Market Cap USD:", "$#{market_cap_usd}"]
      t.add_row ["Change Last 24h:", "#{percent_change_24h}%"]
      t.add_row ["Last Updated:", "#{Time.at(last_updated_unix.to_i)}"]
      t.style = { all_separators: true, width: 60 }
    end
    puts table
  end

end