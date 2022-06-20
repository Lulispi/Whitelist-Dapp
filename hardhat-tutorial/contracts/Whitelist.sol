//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Whitelist{
    //max number of whitelisted addresses possible
    uint8 public maxWhitelistedAddresses;

    //set to true for whitelisted addresses and false for non-whitelisted ones
    mapping(address=>bool) public whitelistedAddresses;

    //keep track of number of whitelisted addresses
    uint8 public numAddressesWhitelisted;  

    //setting the number of whitelisted addresses
    constructor(uint8 _maxWhitelistedAddresses){
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        require(numAddressesWhitelisted < maxWhitelistedAddresses);
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted++;
    }
}