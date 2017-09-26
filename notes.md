#### About
Crypto-Currency Market CLI Gem

*Price updated every 30 second*

- Docs: https://coinmarketcap-nexuist.rhcloud.com/api/all

#### User Interface
1. List Crypto-Currencies
    - Print out list of default number
    - Search for currency
    - Top [1-Number] positive changed
    - Top [1-Number] negative changed
    - Top [1-Number] most expensive
2. Pick one to get more information about
    - Name - name
    - Price - Price
    - Change - Past hour price change
3. Ask user to perform another action
    - Loop menu

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
    - Name - name
    - Price - Price
    - Change - Past hour price change
- Ask user to perform another action

Object Relationship

Rule of thumb:
A method that acts on a single object should be an instance method. A method that acts on a group of similar objects should be a class method.
 
- Currencies instantiate all the coins from coin create method.

Currencies is using the coin factory to create instances for each coin through their names.
