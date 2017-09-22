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

end
