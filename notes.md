#### About
Crypto-Currency Market CLI Gem

*Price updated every 30 second*

- Docs: https://www.cryptonator.com/api/
- Supported currencies: https://www.cryptonator.com/api/currencies
- Example: https://api.cryptonator.com/api/ticker/ltc-usd

#### User Interface
1. List Crypto-Currencies
    - Print out list of default number
    - Search for currency
    - Top 10 positive changed
    - Top 10 negative changed
    - Top 10 most expensive
2. Pick one to get more information about
    - Base - Base currency code
    - Target - Target currency code
    - Price - Volume-weighted price
    - Change - Past hour price change
3. Ask user to perform another action

#### User Experience
- User types crypto-market
- Program respond asking the user for an action
- User choose an action from a list (Top 10 most expensive)
- Program lists top 10 most expensive crypto-currencies
    - (1. BTC - $3800)
    - (2. ETH - $500)
    - (3. LTC - $50)
    - (4. XMP - $20)
    - (5. MDP - $15)
- Program asks which one you want more information about
- User inputs number 1
- Program prints out information about BTC
    - Base - Base currency code
    - Target - Target currency code
    - Price - Volume-weighted price
    - Change - Past hour price change
- Print out default list, ask user for input
    - Print out list of default number
    - Search for currency
    - Top 10 positive changed
    - Top 10 negative changed
    - Top 10 most expensive

Object Relationship

Rule of thumb:
A method that acts on a single object should be an instance method. A method that acts on a group of similar objects should be a class method.
 
- API creates two methods for currencies and specific coins
- Currencies instantiate all the coins from coin create method.

Currencies is using the coin factory to create instances for each coin through their names.

List all the names of currencies > Click to learn more > pull data for that coin
