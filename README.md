# SimpleStorage Contract Using Foundry

## Introduction
This project stems from Smart Contract development learning at [cyfrinupdraft](https://updraft.cyfrin.io).


## Initializing the Foundry Project
The first step to initialize the foundry project is to first setup foundry on your local machine. Use the following steps:
1. Navigate to your home directory and run this command
    ```bash
    curl -L https://foundry.paradigm.xyz | bash
    ```

2. After the above command executes successfully, run this command
    ```bash
    foundryup
    ```

3. Next, navigate to the directory of your choice and create a new directory using the following bash commands
    ```bash
    mkdir foundry-simple-storage-f24
    cd foundry-simple-storage-f24
    ```
    Note that you should use the directory name of your choice i.e. something like `mkdir <directory-name-of-your-choice>`

4. Now we can initialize the foundry project using the below command
    ```bash
    forge init
    ```

## The SimpleStorage Contract and Deployment Script
To create the Contract of your choice (in our case SimpleStorage.sol), navigate to the `src` folder, delete the `Counter.sol` contract that comes with the foundry project by default and create a new file by name `SimpleStorage.sol` or any name of your choice. Remember to follow the naming conventions for variables.

Secondly, navigate to the `script` folder and delete the `Counter.s.sol` script, create a new file in that directory and name it `SimpleStorage.s.sol`. Note that the `SimpleStorage.sol` file refers to Contract file while the `SimpleStorage.s.sol` is the deployment script. Solidity will recognise the `SimpleStorage.s.sol` file as a script file because of the following lines of code:
```Solidity
// To tell Solidity that this is a Script not a Contract,
// we import from forge-std
import { Script } from "forge-std/Script.sol";
import { SimpleStorage } from "../src/SimpleStorage.sol";

```

## Securing Environment Variables
In order to secure our environment variables such as private key so that it is not compromised, we use `keystore` in foundry to encrypt our private key using a password which will be the only requirement to use to private key to sign transactions in the future.

It is safer to run the code that follows on your local terminal not vscode to rule out any chance of exposing your private key. 
The `keystore` is accomplished using the following code:
```bash
cast wallet import <name-of-key> --interactive
```
Follow the prompts that ensue by pasting your private key and entering your password.

To see the list of passwords saved in `keystore`, run this command
```bash
cast wallet list
```

But for the purpose of demonstration, we shall create a `.env` file in our project directory and save our environment variables there. Example:
```
PRIVATE_KEY=<your-private-key>
SEPOLIA_PRIVATE_KEY=<your-private-key-containing-sepolia-eth>
RPC_URL=<your-rpc-url>
SEPOLIA_RPC_URL=<your-rpc-url-for-sepolia-network>
```
Run the following commands to ensure that these variables are stored in the `.env` file
```
source .env
echo $PRIVATE_KEY
```
If everything works find, the private key should be displayed on your terminal.

## Deploy and Interact with the Smart Contract
1. Deploy the Smart Contract using the following command
    ```bash
    forge script script/DeploySimpleStorage.s.sol --rpc-url $RPC_URL --broadcast --private-key $PRIVATE_KEY
    ```
    After deploying the contract successfully, copy the contract address in order to interact with it.

2. Send a transaction by calling the `store` function using the following command
    ```bash
    cast send <contract-address> "store(uint256)" 20 --private-key $PRIVATE_KEY
    ```

3. We can check to see if this transaction was actually recorded on the blockchain by calling the `retrieve` function using the following command
    ```bash
    cast call <contract-address> "retrieve()"  --private-key $PRIVATE_KEY
    ```
    This command will return the hexadecimal value of the number we stored on the blockchain

4. To convert the hexadecimal number to a decimal in order to verify it was the number we stored on the blockchain, run the following command
    ```bash
    cast --to-base <copied-hex-number> dec
    ```
    The number should equal `20`.

## Authors
Nengak Emmanuel Goltong 

[@NengakGoltong](https://twitter.com/nengakgoltong) 
[@nengakgoltong](https://www.linkedin.com/in/nengak-goltong-81009b200)

Under the tutelage of 

Patrick Collins
[@PatrickAlphaC](https://twitter.com/PatrickAlphaC)

## License
This project is licensed under the MIT License - see the LICENSE.md file for details