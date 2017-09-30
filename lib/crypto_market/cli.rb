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

  # User navigation
  def navigation
    table = terminal_table do |t|
      t.title = greeting
      t.add_row [1, 'To see the list of supported coins']
      t.add_row [2, 'Sort by prices']
      t.add_row [3, 'Sort by changes']
      t.add_row [4, 'Get more information about a specific coin']
      t.add_row [5, 'To exit the program']
      t.style = { all_separators: true }
    end
    puts table
    print 'Enter a number: '
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
          t.add_row [1, 'To sort by (+)positive changed coins']
          t.add_row [2, 'To sort by (-)negative changed coins']
          t.add_row [3, 'To see all']
          t.style = { all_separators: true }
        end
        puts table
        print 'Enter a number: '
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
          'Try again'
        end
      when 4
        nested_menu
      when 5
        puts "Goodbye you're now closing Crypto Market"
        exit
      else
        puts 'Enter a correct number in the menu'
        navigation
      end
    end
  end

end

def nested_menu
  table = terminal_table do |t|
    t.title = 'Select a number'
    t.add_row [1, 'To get more information about a specific coin']
    t.add_row [2, 'To return to the menu']
    t.style = { all_separators: true }
  end
  puts table
  print 'Enter a number: '
  input = gets.strip.to_i
  case input
  when 1
    coin_search
    nested_menu
  when 2
    navigation
  else
    puts 'Enter a valid input'
    nested_menu
  end
end

def coin_search
  table = terminal_table do |t|
    t.title = 'Type to continue'
    t.add_row ['Coin name', 'To get more about the specific coin']
    t.add_row ['List', 'To see the list of supported coins']
    t.add_row ['Menu', 'To return to the menu']
    t.style = { all_separators: true }
  end
  puts table
  print 'Enter text: '
  input = gets.strip.downcase
  if input == 'list'
    currencies.print_coin_names
    coin_search
  elsif input == 'menu'
    navigation
  elsif currencies.find_by_name(input).nil?
    puts 'Please enter a correct name'
    coin_search
  else
    currencies.find_by_name(input).coin_attributes
  end
end

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