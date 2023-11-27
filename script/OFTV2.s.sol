// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/OFTV2.sol";

contract OFTV2Script is Script {
    address lzEndpoint = 0x9740FF91F1985D8d2B71494aE1A2f723bb3Ed9E4; //CoreDAO chainId: 153

    function setUp() public {}

    function run() public {
        uint pk = vm.envUint("DEV_PRIVATE_KEY");
        
        address account = vm.addr(pk);
        console.log("Account", account);

        vm.startBroadcast(pk);
        new OFTV2("PLANET", "PLANET", 8, lzEndpoint);
        vm.stopBroadcast();
    }
}

// forge script script/OFTV2.s.sol:OFTV2Script --rpc-url $COREDAO_RPC_URL --broadcast --legacy -vv
// forge flatten --output src/OFTV2.flat.sol src/OFTV2.sol