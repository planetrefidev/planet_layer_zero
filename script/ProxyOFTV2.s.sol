// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/ProxyOFTV2.sol";

contract ProxyOFTV2Script is Script {
    address existingToken = 0x2aD9adDD0d97EC3cDBA27F92bF6077893b76Ab0b; //PLANET on Ethereum
    address lzEndpoint = 0x66A71Dcef29A0fFBDBE3c6a460a3B5BC225Cd675; //Ethereum chainId: 101

    function run() public {
        uint pk = vm.envUint("DEV_PRIVATE_KEY");

        address account = vm.addr(pk);
        console.log("Account", account);

        vm.startBroadcast(pk);
        new ProxyOFTV2(existingToken, 8, lzEndpoint);
        vm.stopBroadcast();
    }
}

// forge script script/ProxyOFTV2.s.sol:ProxyOFTV2Script --rpc-url $ETHEREUM_RPC_URL --broadcast --verify -vv
