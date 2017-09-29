# Gem requirements
require 'pry'
require 'json'
require 'net/http'
require 'terminal-table'
require "crypto_market/version"
require "crypto_market/cli"
require "crypto_market/currencies"
require "crypto_market/coin"
require "crypto_market/api"

# Looked how the owner instantiated a single Object on Github
# https://github.com/tj/terminal-table/blob/master/lib/terminal-table/table_helper.rb
module CryptoMarket
  def terminal_table(headings = [], *rows, &block)
    Terminal::Table.new :headings => headings.to_a, :rows => rows, &block
  end
end