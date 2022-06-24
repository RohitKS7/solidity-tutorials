// NOTE here we import any dependencies (outside of main function so it can load first)
const ethers = require("ethers");
const fs = require("fs-extra"); // comes directly with node.js but you can also add it by "yarn add fs-extra"

// NOTE then we make a main function
async function main() {
  // http://127.0.0.1:7545 => NOTE ganache rpc server for node, so we can connect to this node and deploy our contract on block

  // NOTE we are saying, hey we want to connect this url(node)
  // and this is the way, how our script connects to local blockchain!
  const provider = new ethers.providers.JsonRpcProvider(
    "http://127.0.0.1:7545"
  );

  // get wallet or address
  // NOTE this wallet() function takes 2 parameters ( 1 => private key and 2 => Provider )
  const wallet = new ethers.Wallet(
    "c9715c3fc585c007daaf11dab4c9dbc8613980081a7ee1de2913ef411a596f36",
    provider
  );

  // NOTE we need to import contract and in-order to intract with contracts with need ABI code and Binary complied code of contract
  // NOTE So, we need to read that data from those files(.bin and .abi) in our folder
  //  NOTE to read from those files we need to call a package named "fs" see 3rd line of deploy.js file

  const abi = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.abi", "utf8"); // reading file synchronously
  const binary = fs.readFileSync(
    "./SimpleStorage_sol_SimpleStorage.bin",
    "utf8"
  );
  // NOTE now we have abi and binary code, we can call a function called "contractFactory" its type of deploying function in ethers.js
  const contractFactory = new ethers.ContractFactory(abi, binary, wallet);
  // abi = so we can intract with the contract
  // binary = it is a complied form of contract
  // wallet = to sign a contract with private key
  console.log("deploying, please wait ....");

  // now deploy the contract
  const contract = await contractFactory.deploy(); // ANCHOR wait here until contract deploy
}

// NOTE then we call that function with promise
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
