class CryptoMarket::CLI
  attr_accessor :currencies

  # Initialize the CLI with an instance of all currencies
  def initialize
    @currencies = CryptoMarket::Currencies.new
  end

  # Run command to start the program
  def run
    greeting
    currencies.run
    currencies.list_names
    navigation
  end

  # Greeting message
  def greeting
    puts 'Hello and welcome to the Crypto Market'
    puts 'Here you can get information for the top 100 crypto-currencies on the market'
    puts 'All the prices are updated every 5 minutes'
  end

  # User navigation
  def navigation
    puts '1. Sort by prices'
    puts '2. Sort by changes'
    puts '3. Get more information about a specific coin'
    puts '4. To exit the program'
    input = gets.strip.to_i
    loop do
      case input
      when 1
        print 'Enter a number for how many coins you want to see: '
        input = gets.strip.to_i
        currencies.list_sorted_prices(input)
        puts 'Press 1 to get more information about a specific coin'
        puts 'Press 2 to return to the menu'
        input = gets.strip.to_i
        if input == 1
          print 'Enter the name for the coin you want more information about: '
          input = gets.strip.downcase
          currencies.find_by_name(input).coin_info
        elsif input == 2
          navigation
        end
      when 2
        puts 'Press 1 to sort positive changes'
        puts 'Press 2 to sort negative changes'
        input = gets.to_i
        if input == 1
          print 'Enter a number for how many coins you want to see: '
          input = gets.strip.to_i
          currencies.list_sorted_changes('+', input)
        elsif input == 2
          print 'Enter a number for how many coins you want to see: '
          input = gets.strip.to_i
          currencies.list_sorted_changes('-', input)
        else
          'Try again'
        end
      when 3
        print 'Enter the name for the coin you want more information about: '
        input = gets.strip.downcase
        coin_info(currencies.find_name(input))
      when 4
        puts 'Goodbye'
        break
      else
        navigation
      end
    end
  end

end

## Todo
## Add colors (green for positive change, red for negative change)
## Print out the table nicely with terminal-table
## + / - before change
## Currencies icons?
