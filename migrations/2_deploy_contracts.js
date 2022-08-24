//abi file name should be same as contract name
const  KryptoB= artifacts.require("KryptoBirdz");

module.exports = function (deployer) {
  deployer.deploy(KryptoB);
};




