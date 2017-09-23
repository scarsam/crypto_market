# Crypto Coin belongs to Crypto Currencies
# Responsible for handling all of the Crypto Coin information
# Base, Target, Price, Change

class CryptoMarket::Coin
  attr_accessor :name, :price, :volume, :change

  def new(coin)
    CryptoMarket::Db.coin_info(coin).each do |key, value|
      self.name = value["base"]
      self.price = value["price"]
      self.volume = value["volume"]
      self.change = value["change"]
    end
  end

end