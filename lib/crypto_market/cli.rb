class CryptoMarket::CLI
  attr_accessor :currencies

  # Initialize the CLI with an instance of all currencies
  def initialize(currencies = CryptoMarket::Currencies.new)
    @currencies = currencies
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
    currencies.create_coins_from_properties
    currencies.list_names
    puts 'Put in the number for which coin you want to know more about'
    puts ''
    input = gets.strip.to_i
    coin_info(currencies.find_name(input))
  end

  # Printing coin information
  def coin_info(coin)
    puts "Name: #{coin.name}"
    puts "Price: $#{coin.price}"
    puts "Change: #{coin.change}"
  end

end