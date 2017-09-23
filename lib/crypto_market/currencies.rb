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

  def add_coin(coin)
    coin = CryptoMarket::Db.coin_info(coin)
    name = coin['base']
    price = coin['price']
    volume = coin['volume']
    change = coin['change']
    coins << CryptoMarket::Coin.new(name, price, volume, change)
  end

end