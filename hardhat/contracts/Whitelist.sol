// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

//whitelist Contract Address 0xE160249F3163290a181863075821D4b0B79A578d

contract Whitelist {

    //Maximum No. of addresses which can be whitelisted
    uint8 public maxWhitelistedAddresses;

    //keep track of no. of addresses whitelisted till now
    uint8 public numAddressesWhitelisted;

    mapping(address => bool) public whitelistedAddresses;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {

        //msg.sender is the address of the user who called this function
        require(!whitelistedAddresses[msg.sender], "Sender already in the whitelist");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Max limit reached");
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
        
    }
}