# Crypto Coin belongs to Crypto Currencies
# Responsible for handling all of the Crypto Coin information
# Base, Target, Price, Change

class CryptoMarket::Coin
  attr_accessor :name, :position, :price, :change

  def initialize(name, position, price, change)
    @name = name
    @position = position
    @price = price
    @change = change
  end

  def currency_list
    price.each { |currency, price| puts "#{currency} #{price.to_f.round(2)}" }
  end

end