# nft-marketplace-starter-kit
Please run npm install on the terminal to download the appropriate packages already defined to the package.json file. 
Make sure you are in the source file. 

**Please ensure you have downloaded the following additionally **

1. Ganache :- It’s a personal Blockchain.
```shell
git clone https://github.com/truffle suits/ganache.git
cd ganache
npm install //to run the ganache blockchain
ganahe-cli // to start the ganache blockchain
```

2. Truffle (global installation) :- It’s a developing and testing tool.
```shell
truffle init   // create the truffle.config file
truffle compile //create a json file for all the contracts
truffle migrate  // to deploy the contracts 
truffle migrate --reset // to reset and deploy again the contracts
truffle console //start the truffle console
KryptoB = awit KryptoBirdz.deployed() // deploy the amart contract and store it in the variable
KryptoB.name() //return the name of the token
KryptoB.symbol() //return the symbol of the token
KryptoB.mint('https...1') //Minting  the NFT
KryptoB.balanceOf("0xc127CAb0B5321C4aC1C6220f3eCF26787B9Bcf0e") //how many       tokens does the owner have?
KryptoB.ownerOf(1) //who is the owner of NFT
Krypto.totalSupply() //return to total count of tokens
KryptoB.tokenOfOwnerByIndex('0xc127cab0b5321c4ac1c6220f3ecf26787b9bcf0e',1)
KryptoB.tokenByIndex(1) //return count of tokens by using index

```
3. Metamask.io (hooked up on the browser)

**To run the development server on a local host scripts:** npm run start

For truffle tests and console please consult the official Truffle documentation for updates.




