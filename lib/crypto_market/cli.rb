class CryptoMarket::CLI
  attr_accessor :currencies

  # Initialize the CLI with an instance of all currencies
  def initialize
    @currencies = CryptoMarket::Currencies.new
  end

  # Run command to start the program
  def run
    greeting
    input = gets
    navigation
  end

  # Greeting message
  def greeting
    puts 'Hello and welcome to the Crypto Market'
    puts 'Here you can check current prices on the crypto-currency market'
    puts 'All the prices are updated every 30 seconds'
  end

  # User navigation
  def navigation
    currencies.run
    currencies.list_names
    puts 'Put in the number for which coin you want to know more about'
    puts ''
    input = gets.strip.to_i
    coin_info(currencies.find_name(input))
  end

  # Printing coin information
  def coin_info(coin)
    puts "Name: #{coin.name}"
    puts 'Price: '
    coin.currency_list
    puts "Change: #{coin.change}"
  end

end

## Todo
## Add colors (green for positive change, red for negative change)
## Print out the table nicely with terminal-table
## + / - before change
## Currencies icons?
