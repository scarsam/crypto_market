# Crypto Currencies is having many Crypto Coins
# Ranking all the coins

class CryptoMarket::Currencies
  attr_accessor :all, :coins
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
      all << new_coin
    end
  end

  # Ranks the coins from 0 - user input, if no input default to all of the coins
  def sort_by_price(index = all.length)
    all[0...index].tap do |coin_properties|
      coin_properties.sort_by!.each { |coin| coin.position }
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
    all.each_with_index do |coin, index|
      puts "#{index + 1}. #{coin.name}"
    end
  end

  # Returns hash with symbol, position, price and change for each coin
  def coin_properties
    @db.currencies_list.map do |key, value|
      value.select do |k, v|
        k == 'symbol' || k == 'position' || k == 'price' || k == 'change'
      end
    end
  end

  # Returns hash for specific coin that user is looking for
  def find_name(index)
    all[index - 1]
  end

end