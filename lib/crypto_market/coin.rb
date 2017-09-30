# Crypto Coin belongs to Crypto Currencies
# Responsible for handling all of the Crypto Coin information

class CryptoMarket::Coin
  include CryptoMarket
  attr_accessor :name, :price, :change

  # Instantiate Coin with the attributes below, adds + sign for positive change numbers
  def initialize(name, price, change)
    @name = name
    @price = price
    @change = change.to_f > 0 ? "+#{change}" : change
  end

  # Prints out the coin attributes for the Coin object with terminal-table gem
  def coin_attributes
    table = terminal_table do |t|
      t.title = name.upcase
      t.add_row ['Change:', change]
      price.each do |currency, price|
        t.add_row [currency.upcase, price.to_f.round(2)]
      end
      t.style = { all_separators: true, width: 30 }
    end
    puts table
  end

end