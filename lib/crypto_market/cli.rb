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
      t.add_row [1, 'To see the list of supported coins']
      t.add_row [2, 'Sort by price']
      t.add_row [3, 'Sort by price change']
      t.add_row [4, 'Get more information about a specific coin']
      t.add_row [5, 'To exit the program']
      t.style = { all_separators: true }
    end
    puts table
    enter_input_msg
    input = gets.strip.to_i
    loop do
      case input
      when 1
        currencies.print_coin_names
        nested_menu
      when 2
        currencies.print_sorted_prices
        nested_menu
      when 3
        table = terminal_table do |t|
          t.title = 'Select a number'
          t.add_row [1, 'To see (+)positive price changes']
          t.add_row [2, 'To see (-)negative price changes']
          t.add_row [3, 'To see both negative and positive']
          t.style = { all_separators: true }
        end
        input = nil
        until input == 1 || input == 2 || input == 3
          puts table
          enter_input_msg
          input = gets.to_i
          if input == 1
            currencies.print_sorted_changes('positive')
            nested_menu
          elsif input == 2
            currencies.print_sorted_changes('negative')
            nested_menu
          elsif input == 3
            currencies.print_sorted_changes
            nested_menu
          else
            enter_valid_input_msg
          end
        end

      when 4
        nested_menu
      when 5
        puts "Goodbye you're now closing Crypto Market!"
        exit
      else
        enter_valid_input_msg
        navigation
      end
    end
  end
end

# Nested menu that can be accessed inside the main navigation
def nested_menu
  table = terminal_table do |t|
    t.title = 'Select a number'
    t.add_row [1, 'To get more information about a specific coin']
    t.add_row [2, 'To return to the menu']
    t.style = { all_separators: true }
  end
  puts table
  enter_input_msg
  input = gets.strip.to_i
  case input
  when 1
    coin_search
    nested_menu
  when 2
    navigation
  else
    enter_valid_input_msg
    nested_menu
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
    currencies.find_by_number(input).coin_attributes
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