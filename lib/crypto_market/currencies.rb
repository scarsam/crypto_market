# Crypto Currencies is having many Crypto Coins
# Responsible for handling all of the Crypto Currencies
# Ranking all the coins

class CryptoMarket::Currencies
  attr_accessor :all, :coins
  # This over Constant, currencies might change?
  # Store all the currencies in an Array
  def initialize
    @coins = []
  end

  def all
    @coins
  end

  # Instantiates a new coin and set it's properties unless the coin is nil
  def add_coin(name, code_name)
    coin = CryptoMarket::Db.coin_info(code_name)
    unless coin.nil?
      name = name
      price = coin['price']
      volume = coin['volume']
      change = coin['change']
      coins << CryptoMarket::Coin.new(name, price, volume, change)
    end
  end

  # Instantiates all coins based on their code name
  def create_all_coins_from_names
    find_all_names.each do |name|
      add_coin(name['name'], name['code'])
    end
  end

  # Instantiates all coins based on their code name
  def create_coin_from_names(index)
    coin = find_name(index)
    add_coin(coin['name'], coin['code'])
  end

  # Prints all the names
  def list_names
    find_all_names.each_with_index do |coin, index|
      puts "#{index}. #{coin['name']}"
    end
  end

  # Returns hash with code and name for each coin
  def find_all_names
    CryptoMarket::Db.currencies_list.flat_map do |key, value|
      value.map { |coin| coin.reject { |status| status['statuses'] } }
    end
  end

  # Returns hash with code and name targeted each coin
  def find_name(index)
    find_all_names[index]
  end


end