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
    currencies.list_names
    puts 'Put in the number for which coin you want to know more about'
    puts ''
    input = gets.strip.to_i
    coin = currencies.create_coin_from_names(input)
    coin_info(coin)
  end

  # Printing coin information
  def coin_info(coin)
    puts "Name: #{coin.name}"
    puts "Price: $#{coin.price}"
    puts "Volume: #{coin.volume}"
    puts "Change: #{coin.change}"
  end

end