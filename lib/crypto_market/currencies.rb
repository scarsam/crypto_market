# Crypto Currencies is having many Crypto Coins
# Ranking all the coins

class CryptoMarket::Currencies
  attr_accessor :coins
  # This over Constant, currencies might change?
  # Store all the currencies in an Array
  def initialize
    @db = CryptoMarket::Db
    @coins = []
  end

  # Instantiates new coins from Coin class with selected properties
  def run
    create_coins_from_properties
  end

  # Instantiates a new coin and set it's properties unless the coin is nil
  def create_coin(coin)
    name = coin['symbol']
    position = coin['position']
    price = coin['price']
    change = coin['change']
    CryptoMarket::Coin.new(name, position, price, change).tap do |new_coin|
      coins << new_coin
    end
  end

  # Ranks the coins from 0 - user input, if no input default to all of the coins
  def sort_by_price(index = coins.length)
    coins.sort_by { |coin| coin.price['usd'] }.reverse[0...index]
  end

  # Ranks the coins from 0 - user input, if no input default to all of the coins
  def sort_by_change(option, index = coins.length)
    if option == 'positive'
      coins.sort_by { |coin| coin.change.to_i }.reverse[0...index]
    elsif option == 'negative'
      coins.sort_by { |coin| coin.change.to_i }[0...index]
    end
  end

  # Instantiates all coins based on their code name
  def create_coins_from_properties
    coin_properties.each do |coin|
      create_coin(coin)
    end
  end

  # Prints all the coin names with numbers from the all Array
  def list_names
    coins.each_with_index do |coin, index|
      puts "#{index + 1}. #{coin.name}"
    end
  end

  # Returns hash with symbol, position, price and change for each coin
  def coin_properties
    @db.currencies_list.map do |key, value|
      value.select do |k, v|
        (k == 'symbol' || k == 'position' || k == 'price' || k == 'change') unless v == '?'
      end
    end
  end

  # Returns hash for specific coin that user is looking for
  def find_name(index)
    coins[index - 1]
  end

end