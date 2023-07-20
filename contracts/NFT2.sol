// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "./NFT.sol";

contract SpaceNFT2 is SpaceNFT{

    // just adding this function to SpaceNFT
    function test() public pure returns(string memory){
        return "Contract Upgraded";
    }
}