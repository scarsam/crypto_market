# Crypto Currencies is having many Crypto Coins
# Responsible for handling all of the Crypto Currencies
# Ranking all the coins

class CryptoMarket::Currencies
  attr_accessor :all
  # This over Constant, currencies might change?
  # Store all the currencies in an Array
  @@all = []

  # Call class.all to see list of all currencies
  def self.all
    @@all
  end

  def self.add_coin
    CryptoMarket::Db.find_names[0].flatten do |coin|
      CryptoMarket::Coin.new.new(coin)
    end
  end

end