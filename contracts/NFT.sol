// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// this is a Implementation contract

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";


contract SpaceNFT is Initializable,
    ERC721Upgradeable,
    UUPSUpgradeable,
    OwnableUpgradeable
    {

    // initializer modifier which ensure that the
    // initialize function is only called once
    function initialize() public initializer{

        __ERC721_init("SpaceNFT", "SNFT");
        __Ownable_init();
        _mint(msg.sender , 1);

    }

    // onlyowner is able to upgrade this contracts
    function _authorizeUpgrade(address newImplementation)
    internal
    override
    onlyOwner{}

    }
