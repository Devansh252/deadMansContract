# deadMansContract
a smart contract that will send all of its balance to a pre-set address if the owner of that contract has not called a still_alive function on the contract in the last 10 blocks.


## Compile our contract
```shell
npx hardhat compile 
```

## Deploy our contract
```shell 
npx hardhat run scripts/deploy.js --network goerli 
```
