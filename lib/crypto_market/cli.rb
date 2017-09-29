class CryptoMarket::CLI
  include CryptoMarket
  attr_accessor :currencies

  # Initialize the CLI with an instance of all currencies
  def initialize
    @currencies = CryptoMarket::Currencies.new
  end

  # Run command to start the program
  def run
    greeting
    currencies.run
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
    table = terminal_table do |t|
      t.title = 'Crypto Market Navigation [Enter a number]'
      t.add_row [1, 'Sort by prices']
      t.add_row [2, 'Sort by changes']
      t.add_row [3, 'Get more information about a specific coin']
      t.add_row [4, 'To see the list of supported coins']
      t.add_row [5, 'To exit the program']
      t.style = { all_separators: true }
    end
    puts table
    input = gets.strip.to_i
    loop do
      case input
      when 1
        print 'Enter a number for how many coins you want to see: '
        input = gets.strip.to_i
        currencies.print_sorted_prices(input)
        nested_option
      when 2
        puts 'Press 1 to sort positive changes'
        puts 'Press 2 to sort negative changes'
        input = gets.to_i
        if input == 1
          print 'Enter a number for how many coins you want to see: '
          input = gets.strip.to_i
          currencies.print_sorted_changes('+', input)
        elsif input == 2
          print 'Enter a number for how many coins you want to see: '
          input = gets.strip.to_i
          currencies.print_sorted_changes('-', input)
        else
          'Try again'
        end
      when 3
        print 'Enter the name for the coin you want more information about: '
        input = gets.strip.downcase
        currencies.find_by_name(input).coin_attributes
      when 4
        currencies.print_coin_names
        nested_option
      when 5
        puts 'Goodbye'
        break
      else
        navigation
      end
    end
  end

end

def nested_option
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
end