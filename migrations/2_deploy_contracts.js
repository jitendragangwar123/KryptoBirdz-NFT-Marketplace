//file name should be same as contract file name
const Kryptobirds = artifacts.require("KryptoBirdz");

module.exports = function (deployer) {
  deployer.deploy(Kryptobirds);
};
