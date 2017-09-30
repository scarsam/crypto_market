# Crypto Currencies is having many Crypto Coins

class CryptoMarket::Currencies
  include CryptoMarket
  attr_accessor :coins
  # Store all the currencies in an Array
  def initialize
    @coin_data = CryptoMarket::Api
    @coins = []
  end

  # Instantiates new coins from Coin class with attributes specified from coin_attribues method
  def run
    create_coins_from_attributes
  end

  # Instantiates a new coin and set it's properties unless the coin is nil
  def create_coin(coin)
    name = coin['symbol']
    price = coin['price']
    change = coin['change']
    CryptoMarket::Coin.new(name, price, change).tap do |new_coin|
      coins << new_coin
    end
  end

  # Instantiates all coins based on their code name
  def create_coins_from_attributes
    coin_attributes.map do |coin|
      create_coin(coin)
    end
  end

  # Returns an Array with hashes containing information specified below for each coin
  def coin_attributes
    @coin_data.fetch_coin_data.map do |coin_name, coin_attributes|
      coin_attributes.select do |attribute, attribute_value|
        (attribute == 'symbol' || attribute == 'price' || attribute == 'change') unless attribute_value == '?'
      end
    end
  end

  # Returns an instance of Coin for the specific coin that user is looking for
  def find_by_name(name)
    coins.detect { |coin| coin.name == name }
  end

  # Ranks the coins from 0 - user input, if no input default to all of the coins
  def sort_by_price
    coins.sort_by { |coin| coin.price['usd'] }.reverse
  end

  # Return sorted Array based on user input (positive, negative or default)
  def sort_by_change(input)
    if input == 'positive'
      coins.select { |coin| coin.change.to_f > 0 }.sort_by { |coin| coin.change }.reverse
    elsif input == 'negative'
      coins.select { |coin| coin.change.to_f < 0 }.sort_by { |coin| coin.change }
    else
      coins.sort_by { |coin| coin.change.to_f }.reverse
    end
  end

  # Prints out the price, possible to select top(number)
  def print_sorted_prices
    sort_by_price.each do |coin|
      table = terminal_table do |t|
        t.add_row [coin.name, "$#{coin.price['usd'].to_f.round(4)}"]
        t.style = { all_separators: true, width: 40 }
      end
      puts table
    end
  end

  # Prints out the changes based on positive, negative or default input, also possible to select top(number)
  def print_sorted_changes(input = nil)
    sort_by_change(input).each do |coin|
      table = terminal_table do |t|
        t.add_row [coin.name, "#{coin.change}%"]
        t.style = { all_separators: true, width: 40 }
      end
      puts table
    end
  end

  # Prints all the coin names with numbers from the all Array
  def print_coin_names
    coins.each_with_index do |coin, index|
      table = terminal_table do |t|
        t.add_row [index + 1, coin.name]
        t.style = { all_separators: true, width: 15 }
      end
      puts table
    end
  end

end