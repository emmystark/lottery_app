const HDWalletProvider = require("@truffle/hdwallet-provider");
const { Web3 } = require("web3");
//updated web3 and hdwallet-provider imports added for convenience

// deploy code will go here
const { interface, bytecode } = require("./compile");
const provider = new HDWalletProvider(
  "record lumber apology crawl cram bomb improve fragile copper either mind story",
  "https://sepolia.infura.io/v3/1770c38d631940fb878c22ad48ff556b"
);
const web3 = new Web3(provider);

const deploy = async () => {
  const accounts = await web3.eth.getAccounts();

  console.log("Attempting to deploy from account", accounts[0]);

  const result = await new web3.eth.Contract(JSON.parse(interface))
    .deploy({ data: bytecode })
    .send({ gas: "1000000", from: accounts[0] });

  console.log("Contract deployed to ", result.options.address);
  provider.engine.stop();
};
deploy();
