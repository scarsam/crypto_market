class CryptoMarket::Api

  def self.api_call
    url = URI('https://api.coinmarketcap.com/v1/ticker/')
    response = Net::HTTP.get(url)
    JSON.parse(response)
  end

  def self.fetch_coin_data
    api_call.reject do |coin, _|
      coin.any? do |_, attribute_value|
        attribute_value == '?' || attribute_value.nil?
      end
    end
  end

end
