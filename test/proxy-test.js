
const { expect } = require("chai");
const { ethers } = require("hardhat");
const hre = require("hardhat");


describe("ERC721 Upgradeable", function () {
  it("Should deploy an upgradeable ERC721 Contract", async function () {
    const SpaceNFT = await ethers.getContractFactory("SpaceNFT");
    const SpaceNFT2 = await ethers.getContractFactory("SpaceNFT2");

    // Deploy SpaceNFT as a UUPS Proxy Contract
    let proxyContract = await hre.upgrades.deployProxy(SpaceNFT, {
      kind: "uups",
    });
    const [owner] = await ethers.getSigners();
    const ownerOfToken1 = await proxyContract.ownerOf(1);

    expect(ownerOfToken1).to.equal(owner.address);

    // Deploy SpaceNFT2 as an upgrade to SpaceNFT
    proxyContract = await hre.upgrades.upgradeProxy(proxyContract, SpaceNFT2);
    // Verify it has been upgraded
    expect(await proxyContract.test()).to.equal("upgraded");
  });
});

