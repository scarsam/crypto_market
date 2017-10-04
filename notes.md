#### About
Crypto-Currency Market CLI Gem

*Price updated every 5 minutes*

- New Docs: https://coinmarketcap.com/api/

#### User Interface
1. List Crypto-Currencies
    - Welcome message
    - Navigation
        - List all currencies
        - Sort by pricing
        - Sort by changed
        - Get more information about specific coin
        - Exit
2. Pick one to get more information about
    - Type name of coin you want more information about
        - Name - name
        - Price - Price
        - Change - Past hour price change
3. Sort by pricing
    - Display all coins based on their price (Highest > lowest)
4. Sort by changes
    - Sort by positive changed
        - See positive changed coins
    - Sort by negative changed
        - See negative changed coins
    - See all
        - See all coins
5. Ask user to perform another action
    - Loop menu

Object Relationship

Rule of thumb:
A method that acts on a single object should be an instance method. A method that acts on a group of similar objects should be a class method.