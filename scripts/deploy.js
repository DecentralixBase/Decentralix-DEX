const { ethers } = require("ethers");

// Specify the provider for Shardeum testnet
const provider = new ethers.providers.JsonRpcProvider("https://dapps.shardeum.org");

// Replace with your own wallet's private key
const privateKey = "8452f090e5b60889aabe05c03ed43959aaa3ec33831d1dadf8b0401665213ff5";

// Connect to the wallet using the private key
const wallet = new ethers.Wallet(privateKey, provider);

// Replace with the path to your compiled DEXFaucet.sol contract JSON file
const contractJSON = require("./artifacts/contracts/DEXFaucet.sol/DEXFaucet.json");

// Create a factory for the DEXFaucet contract
const contractFactory = new ethers.ContractFactory(contractJSON.abi, contractJSON.bytecode, wallet);

// Deploy the contract
async function deployContract() {
  const contract = await contractFactory.deploy();
  await contract.deployed();

  console.log(`Contract deployed to address: ${contract.address}`);
}

deployContract().catch((error) => {
  console.error("Error deploying contract:", error);
});
