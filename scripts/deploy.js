// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
// const hre = require("hardhat");

async function main() {

  const itemmanager = await hre.ethers.deployContract("ItemManager");

  await itemmanager.waitForDeployment();

  console.log(
    `ItemManager with deployed to ${itemmanager.target}`
  );
}

// 0xd9145CCE52D386f254917e481eB44e9943F39138

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
