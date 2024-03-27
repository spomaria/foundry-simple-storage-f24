// SPDX-Licencse-Identifier: MIT

pragma solidity 0.8.18;

// To tell Solidity that this is a Script not a Contract,
// we import from forge-std
import { Script } from "forge-std/Script.sol";
import { SimpleStorage } from "../src/SimpleStorage.sol";

contract DeploySimpleStorage is Script{
    function run() external payable returns(SimpleStorage){
        // Note that any computations for which gas fee is not intended to be paid
        // should come either before the 'vm.startBroadcast();' or
        // after the 'vm.stopBroadcast();'
        vm.startBroadcast();
            //Now deploy an instance of the SimpleStorage contract
            SimpleStorage simpleStorage = new SimpleStorage();
        vm.stopBroadcast();
        return simpleStorage;
    }
    
}
