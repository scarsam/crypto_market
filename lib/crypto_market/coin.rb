# Crypto Coin belongs to Crypto Currencies
# Responsible for handling all of the Crypto Coin information
# Base, Target, Price, Change

class CryptoMarket::Coin
  attr_accessor :name, :price, :volume, :change

  def initialize(name, price, volume, change)
    @name = name
    @price = price
    @volume = volume
    @change = change
  end

end