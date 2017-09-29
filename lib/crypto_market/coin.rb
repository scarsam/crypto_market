# Crypto Coin belongs to Crypto Currencies
# Responsible for handling all of the Crypto Coin information

class CryptoMarket::Coin
  attr_accessor :name, :price, :change

  def initialize(name, price, change)
    @name = name
    @price = price
    @change = change.to_f > 0 ? "+#{change}" : change
  end

  # Prints out the coin value in different currencies
  def currency_list
    price.select { |currency, price| puts "#{currency.upcase} #{price.to_f.round(2)}" }
  end

  # Printing coin information
  def coin_info
    puts "Name: #{name}"
    puts 'Price: '
    currency_list
    puts "Change: #{change}"
  end

end