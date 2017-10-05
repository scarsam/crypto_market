class CryptoMarket::CLI
  include CryptoMarket
  attr_accessor :currencies

  # Initialize the CLI with an instance of all currencies
  def initialize
    @currencies = CryptoMarket::Currencies.new
  end

  # Run command to start the program
  def run
    currencies.run
    puts ascii_welcome
    navigation
  end

  # Greeting message
  def greeting
    <<-DOC
Welcome to the Crypto Market
All the prices are updated every 5 minutes
Enter a number to navigate
    DOC
  end

  def enter_valid_input_msg
    puts 'Enter a correct number from the list'
  end

  def enter_input_msg
    print 'Enter a number: '
  end

  # User navigation
  def navigation
    table = terminal_table do |t|
      t.title = greeting
      t.add_row [1, 'Get more information about a specific coin']
      t.add_row [2, 'Sort by price']
      t.add_row [3, 'Sort by price change the last 24h']
      t.add_row [4, 'To exit the program']
      t.style = { all_separators: true, width: 60 }
    end
    puts table
    enter_input_msg
    input = gets.strip.to_i
    loop do
      case input
      when 1
        coin_search
        navigation
      when 2
        currencies.print_sorted_prices
        navigation
      when 3
        table = terminal_table do |t|
          t.title = 'Select a number'
          t.add_row [1, '(+) Changed coins the last 24h']
          t.add_row [2, '(-) Changed coins the last 24h']
          t.add_row [3, 'All Changed coins the last 24h']
          t.style = { all_separators: true, width: 60 }
        end
        input = nil
        until input == 1 || input == 2 || input == 3
          puts table
          enter_input_msg
          input = gets.strip.to_i
          if input == 1
            currencies.print_sorted_changes('positive')
            navigation
          elsif input == 2
            currencies.print_sorted_changes('negative')
            navigation
          elsif input == 3
            currencies.print_sorted_changes
            navigation
          else
            enter_valid_input_msg
          end
        end
      when 4
        puts "Goodbye you're now closing Crypto Market!"
        exit
      else
        enter_valid_input_msg
        navigation
      end
    end
  end
end

# Search for specific name for a coin and return information about it
def coin_search
  currencies.print_coin_names
  enter_input_msg
  input = gets.strip.to_i
  if currencies.find_by_number(input).nil?
    enter_valid_input_msg
    coin_search
  else
    currencies.find_by_number(input).attributes
    navigation
  end
end

# Ascii welcome message
def ascii_welcome
  <<-'HEREDOC'

    /$$$$$$                                  /$$                     /$$      /$$                     /$$                   /$$
   /$$__  $$                                | $$                    | $$$    /$$$                    | $$                  | $$
  | $$  \__/  /$$$$$$  /$$   /$$  /$$$$$$  /$$$$$$    /$$$$$$       | $$$$  /$$$$  /$$$$$$   /$$$$$$ | $$   /$$  /$$$$$$  /$$$$$$
  | $$       /$$__  $$| $$  | $$ /$$__  $$|_  $$_/   /$$__  $$      | $$ $$/$$ $$ |____  $$ /$$__  $$| $$  /$$/ /$$__  $$|_  $$_/
  | $$      | $$  \__/| $$  | $$| $$  \ $$  | $$    | $$  \ $$      | $$  $$$| $$  /$$$$$$$| $$  \__/| $$$$$$/ | $$$$$$$$  | $$
  | $$    $$| $$      | $$  | $$| $$  | $$  | $$ /$$| $$  | $$      | $$\  $ | $$ /$$__  $$| $$      | $$_  $$ | $$_____/  | $$ /$$
  |  $$$$$$/| $$      |  $$$$$$$| $$$$$$$/  |  $$$$/|  $$$$$$/      | $$ \/  | $$|  $$$$$$$| $$      | $$ \  $$|  $$$$$$$  |  $$$$/
   \______/ |__/       \____  $$| $$____/    \___/   \______/       |__/     |__/ \_______/|__/      |__/  \__/ \_______/   \___/
                       /$$  | $$| $$
                      |  $$$$$$/| $$
                       \______/ |__/

  HEREDOC
end