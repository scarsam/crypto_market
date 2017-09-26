# Crypto Currencies is having many Crypto Coins
# Responsible for handling all of the Crypto Currencies
# Ranking all the coins

class CryptoMarket::Currencies
  attr_accessor :all, :coins
  # This over Constant, currencies might change?
  # Store all the currencies in an Array
  def initialize
    @db = CryptoMarket::Db
    @coins = []
  end

  # Print all coins
  def all
    @coins
  end

  # Instantiates a new coin and set it's properties unless the coin is nil
  def add_coin(coin)
    name = coin['symbol']
    position = coin['position']
    price = coin['price']
    change = coin['change']
    new_coin = CryptoMarket::Coin.new(name, position, price, change)
    all << new_coin
    new_coin
  end

  def sort_by_price(index = all.length)
    top_prices = all[0...index].sort_by!.each { |coin| coin.position }
    top_prices
  end

  # Instantiates all coins based on their code name
  def create_coins_from_properties
    coin_properties.each do |coin|
      add_coin(coin)
    end
  end

  # Prints all the names with numbers
  def list_names
    all.each_with_index do |coin, index|
      puts "#{index + 1}. #{coin.name}"
    end
  end

  # Returns hash with code and name for each coin
  def coin_properties
    @db.currencies_list.map do |key, value|
      value.select do |k, v|
        k == 'symbol' || k == 'position' || k == 'price' || k == 'change'
      end
    end
  end

  # Returns hash with code and name targeted each coin
  def find_name(index)
    all[index - 1]
  end

end