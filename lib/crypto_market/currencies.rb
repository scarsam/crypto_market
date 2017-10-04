# Crypto Currencies is having many Crypto Coins

class CryptoMarket::Currencies
  include CryptoMarket
  attr_accessor :coins
  # Store all the currencies in an Array
  def initialize
    @api_data = CryptoMarket::Api.fetch_coin_data
    @coins = []
  end

  # Instantiates new coins from Coin class with attributes specified from coin_attribues method
  def run
    create_coins_from_attributes
  end

  # Instantiates a new Coin based on hash that gets passed in and set it's attributes
  def create_coin(coin)
    name = coin['name']
    price_usd = coin['price_usd']
    price_btc = coin['price_btc']
    market_cap_usd = coin['market_cap_usd']
    percent_change_24h = coin['percent_change_24h']
    last_updated_unix = coin['last_updated']
    CryptoMarket::Coin.new(name, price_usd, price_btc, market_cap_usd,
                           percent_change_24h, last_updated_unix).tap do |new_coin|
      coins << new_coin
    end
  end

  # Call the create_coin method for each Coin hash
  def create_coins_from_attributes
    @api_data.each do |coin|
      create_coin(coin)
    end
  end

  # Returns an instance of Coin for the specific Coin that user is looking for
  def find_by_number(input)
    coins[input - 1]
  end

  # Ranks the coins from based on their USD price
  def sort_by_price_usd
    coins.sort_by { |coin| coin.price_usd }.reverse
  end

  # Return sorted Array based on user input (positive, negative or default)
  def sort_by_change(input)
    if input == 'positive'
      coins.select { |coin| coin.percent_change_24h.to_f > 0 }.sort_by { |coin| coin.percent_change_24h.to_f }.reverse
    elsif input == 'negative'
      coins.select { |coin| coin.percent_change_24h.to_f < 0 }.sort_by { |coin| coin.percent_change_24h.to_f }
    else
      coins.sort_by { |coin| coin.percent_change_24h.to_f }.reverse
    end
  end

  # Prints out the price for all Coin objects with terminal-table gem
  def print_sorted_prices
    sort_by_price_usd.each do |coin|
      table = terminal_table do |t|
        t.add_row [coin.name, "$#{coin.price_usd.to_f.round(4)}"]
        t.style = { all_separators: true, width: 60 }
      end
      puts table
    end
  end

  # Prints out the change for all Coin objects with terminal-table gem
  def print_sorted_changes(input = nil)
    sort_by_change(input).each do |coin|
      table = terminal_table do |t|
        t.add_row [coin.name, "#{coin.percent_change_24h}%"]
        t.style = { all_separators: true, width: 60 }
      end
      puts table
    end
  end

  # Prints out the names for all Coin objects with terminal-table gem
  def print_coin_names
    coins.each_with_index do |coin, index|
      table = terminal_table do |t|
        t.add_row [index + 1, coin.name]
        t.style = { all_separators: true, width: 60 }
      end
      puts table
    end
  end

end