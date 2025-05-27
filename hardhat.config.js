require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-ethers");
const { privateKeys } = require("./secrets.json");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async () => {
  const accounts = await ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  defaultNetwork: "sphinx",
  networks: {
    hardhat: {},
    sphinx: {
      url: "https://dapps.shardeum.org",
      chainId: 8081,
      accounts: ["0x8452f090e5b60889aabe05c03ed43959aaa3ec33831d1dadf8b0401665213ff5"],
    },
  },
  solidity: {
    //configure solidity version for compilation
    version: "0.8.9",
    settings: {
      optimizer: {
        enabled: true,
      },
    },
  },
  paths: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts",
  },
  mocha: {
    timeout: 20000,
  },
};